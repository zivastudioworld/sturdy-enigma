import { createClient } from "@/lib/supabase/server";
import type { Product } from "@/lib/types";
import { ProductSearch } from "@/components/product-search";

// Map DB trend_direction values to Product type values
function mapTrendDirection(dbValue: string): "up" | "down" | "stable" {
  switch (dbValue) {
    case "rising":
      return "up";
    case "declining":
      return "down";
    default:
      return "stable";
  }
}

// Map a raw DB row to the Product type
function mapRowToProduct(row: Record<string, unknown>): Product {
  return {
    id: row.id as string,
    name: row.title as string,
    description: (row.description as string) ?? "",
    category: row.category as string,
    image_url: row.image_url as string,
    price: Number(row.price),
    source_platform: row.platform as string,
    source_url: row.source_url as string,
    opportunity_score: row.opportunity_score as number,
    competition_rating: row.competition_level as Product["competition_rating"],
    demand_rating: row.demand_level as Product["demand_rating"],
    profit_margin_estimate: Number(row.profit_margin_estimate ?? 0),
    trend_direction: mapTrendDirection(row.trend_direction as string),
    created_at: row.created_at as string,
    updated_at: (row.created_at as string) ?? new Date().toISOString(),
  };
}

export default async function HomePage() {
  let products: Product[] = [];
  let fetchError: string | null = null;

  try {
    const supabase = await createClient();

    const { data, error } = await supabase
      .from("products")
      .select("*")
      .order("opportunity_score", { ascending: false });

    if (error) {
      fetchError = error.message;
    } else if (data) {
      products = data.map(mapRowToProduct);
    }
  } catch (err) {
    fetchError = err instanceof Error ? err.message : "Failed to load products";
  }

  return (
    <main className="flex-1">
      <div className="max-w-7xl mx-auto px-4 py-8">
        {/* Page header */}
        <div className="mb-8">
          <h1 className="text-2xl sm:text-3xl font-bold text-gray-900">
            Discover Products
          </h1>
          <p className="mt-1 text-sm text-gray-500">
            Browse AI-scored product opportunities across 8 categories
          </p>
        </div>

        <ProductSearch initialProducts={products} fetchError={fetchError} />
      </div>
    </main>
  );
}
