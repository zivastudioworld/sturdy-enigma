import type { Product } from "@/lib/types";
import { ProductCard, ProductCardSkeleton } from "./product-card";

interface ProductGridProps {
  products: Product[];
  loading: boolean;
  error: string | null;
  onRetry: () => void;
}

export function ProductGrid({ products, loading, error, onRetry }: ProductGridProps) {
  // Loading state
  if (loading) {
    return (
      <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
        {Array.from({ length: 8 }).map((_, i) => (
          <ProductCardSkeleton key={i} />
        ))}
      </div>
    );
  }

  // Error state
  if (error) {
    return (
      <div className="flex flex-col items-center justify-center py-16 text-center">
        <div className="rounded-full bg-red-100 p-4 mb-4">
          <svg className="h-8 w-8 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L4.082 16.5c-.77.833.192 2.5 1.732 2.5z"
            />
          </svg>
        </div>
        <h3 className="text-lg font-semibold text-gray-900 mb-1">Something went wrong</h3>
        <p className="text-sm text-gray-500 mb-4 max-w-sm">{error}</p>
        <button
          type="button"
          onClick={onRetry}
          className="rounded-lg bg-brand-600 px-5 py-2.5 text-sm font-medium text-white hover:bg-brand-700 transition-colors"
        >
          Try Again
        </button>
      </div>
    );
  }

  // Empty state
  if (products.length === 0) {
    return (
      <div className="flex flex-col items-center justify-center py-16 text-center">
        <div className="rounded-full bg-gray-100 p-4 mb-4">
          <svg className="h-8 w-8 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
            />
          </svg>
        </div>
        <h3 className="text-lg font-semibold text-gray-900 mb-1">No products found</h3>
        <p className="text-sm text-gray-500 max-w-sm">
          Try adjusting your search or selecting a different category to find what you&apos;re looking for.
        </p>
      </div>
    );
  }

  // Results
  return (
    <>
      <p className="text-sm text-gray-500 mb-4">
        Showing <span className="font-medium text-gray-700">{products.length}</span> product{products.length !== 1 ? "s" : ""}
      </p>
      <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
        {products.map((product) => (
          <ProductCard key={product.id} product={product} />
        ))}
      </div>
    </>
  );
}
