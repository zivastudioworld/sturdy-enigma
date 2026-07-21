"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import type { User } from "@supabase/supabase-js";

export function AuthButtons({ user }: { user: User | null }) {
  const router = useRouter();
  const supabase = createClient();

  async function handleSignOut() {
    await supabase.auth.signOut();
    router.push("/");
    router.refresh();
  }

  if (user) {
    return (
      <div className="flex items-center gap-3">
        <span className="text-sm text-gray-600 hidden sm:inline">
          {user.email}
        </span>
        <button
          onClick={handleSignOut}
          className="text-sm text-gray-600 hover:text-gray-900 font-medium transition-colors"
        >
          Sign Out
        </button>
      </div>
    );
  }

  return (
    <Link
      href="/login"
      className="rounded-lg bg-brand-600 px-4 py-1.5 text-sm text-white font-medium hover:bg-brand-700 transition-colors"
    >
      Sign In
    </Link>
  );
}
