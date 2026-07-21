"use client";

import { useState, useMemo, useCallback } from "react";
import { useRouter } from "next/navigation";
import type { Product } from "@/lib/types";
import { CategoryBar } from "./category-bar";
import { SearchBar } from "./search-bar";
import { ProductGrid } from "./product-grid";

interface ProductSearchProps {
  initialProducts: Product[];
  fetchError: string | null;
}

export function ProductSearch({ initialProducts, fetchError }: ProductSearchProps) {
  const router = useRouter();
  const [category, setCategory] = useState<string | null>(null);
  const [query, setQuery] = useState("");

  const handleRetry = useCallback(() => {
    router.refresh();
  }, [router]);

  // Client-side filtering
  const filtered = useMemo(() => {
    let result = initialProducts;

    if (category) {
      result = result.filter((p) => p.category === category);
    }

    if (query.trim()) {
      const q = query.toLowerCase().trim();
      result = result.filter(
        (p) =>
          p.name.toLowerCase().includes(q) ||
          p.description.toLowerCase().includes(q),
      );
    }

    return result;
  }, [initialProducts, category, query]);

  return (
    <div className="space-y-6">
      {/* Search Bar */}
      <SearchBar value={query} onChange={setQuery} />

      {/* Category Bar */}
      <CategoryBar active={category} onChange={setCategory} />

      {/* Results Grid */}
      <ProductGrid
        products={filtered}
        loading={false}
        error={fetchError}
        onRetry={handleRetry}
      />
    </div>
  );
}
