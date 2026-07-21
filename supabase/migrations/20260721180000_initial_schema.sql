-- Scoutify AI: Initial Database Schema
-- Migration: 20260721180000_initial_schema

-- ============================================================
-- 1. EXTENSIONS
-- ============================================================
create extension if not exists "pgcrypto";

-- ============================================================
-- 2. TABLES
-- ============================================================

-- profiles: extends Supabase auth.users
create table if not exists profiles (
  id              uuid primary key references auth.users(id) on delete cascade,
  email           text,
  full_name       text,
  subscription_tier text not null default 'free' check (subscription_tier in ('free', 'pro', 'agency')),
  searches_remaining integer not null default 5,
  searches_reset_at timestamptz,
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

-- searches: stores user search history
create table if not exists searches (
  id              uuid primary key default gen_random_uuid(),
  user_id         uuid not null references profiles(id) on delete cascade,
  query           text,
  results_count   integer,
  created_at      timestamptz not null default now()
);

-- products: the catalog of products with AI-scored metrics
create table if not exists products (
  id                  uuid primary key default gen_random_uuid(),
  title               text not null,
  description         text,
  image_url           text,
  category            text,
  platform            text,
  source_url          text,
  price               numeric(10,2),
  currency            text not null default 'USD',
  opportunity_score   integer check (opportunity_score >= 0 and opportunity_score <= 100),
  competition_level   text check (competition_level in ('low', 'medium', 'high')),
  demand_level        text check (demand_level in ('low', 'medium', 'high')),
  profit_margin_estimate numeric(5,2),
  trend_direction     text check (trend_direction in ('rising', 'stable', 'declining')),
  created_at          timestamptz not null default now()
);

-- saved_products: user bookmarks/favorites
create table if not exists saved_products (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null references profiles(id) on delete cascade,
  product_id  uuid not null references products(id) on delete cascade,
  collection  text not null default 'Favorites',
  notes       text,
  created_at  timestamptz not null default now(),
  unique(user_id, product_id)
);

-- launch_plans: AI-generated launch plans per product per user
create table if not exists launch_plans (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null references profiles(id) on delete cascade,
  product_id  uuid not null references products(id) on delete cascade,
  plan_content jsonb,
  created_at  timestamptz not null default now()
);

-- ============================================================
-- 3. INDEXES
-- ============================================================

create index idx_searches_user_id on searches(user_id);
create index idx_searches_created_at on searches(created_at desc);
create index idx_products_category on products(category);
create index idx_products_opportunity_score on products(opportunity_score desc);
create index idx_products_platform on products(platform);
create index idx_saved_products_user_id on saved_products(user_id);
create index idx_launch_plans_user_id on launch_plans(user_id);
create index idx_launch_plans_product_id on launch_plans(product_id);

-- ============================================================
-- 4. ROW LEVEL SECURITY
-- ============================================================

-- profiles
alter table profiles enable row level security;

create policy "Users can read own profile"
  on profiles for select
  using (auth.uid() = id);

create policy "Users can update own profile"
  on profiles for update
  using (auth.uid() = id);

-- searches
alter table searches enable row level security;

create policy "Users can read own searches"
  on searches for select
  using (auth.uid() = user_id);

create policy "Users can insert own searches"
  on searches for insert
  with check (auth.uid() = user_id);

-- products: any authenticated user can read; inserts are service_role only
alter table products enable row level security;

create policy "Authenticated users can read products"
  on products for select
  using (auth.role() = 'authenticated');

-- saved_products
alter table saved_products enable row level security;

create policy "Users can read own saved products"
  on saved_products for select
  using (auth.uid() = user_id);

create policy "Users can insert own saved products"
  on saved_products for insert
  with check (auth.uid() = user_id);

create policy "Users can update own saved products"
  on saved_products for update
  using (auth.uid() = user_id);

create policy "Users can delete own saved products"
  on saved_products for delete
  using (auth.uid() = user_id);

-- launch_plans
alter table launch_plans enable row level security;

create policy "Users can read own launch plans"
  on launch_plans for select
  using (auth.uid() = user_id);

create policy "Users can insert own launch plans"
  on launch_plans for insert
  with check (auth.uid() = user_id);

create policy "Users can update own launch plans"
  on launch_plans for update
  using (auth.uid() = user_id);

create policy "Users can delete own launch plans"
  on launch_plans for delete
  using (auth.uid() = user_id);

-- ============================================================
-- 5. TRIGGERS
-- ============================================================

-- Auto-create a profile when a new user signs up
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, email, full_name)
  values (
    new.id,
    new.email,
    new.raw_user_meta_data->>'full_name'
  );
  return new;
end;
$$ language plpgsql security definer;

create or replace trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- Auto-update profiles.updated_at on any change
create or replace function public.update_updated_at_column()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

create trigger set_profiles_updated_at
  before update on profiles
  for each row execute function public.update_updated_at_column();
