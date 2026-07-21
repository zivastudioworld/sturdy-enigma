import type { Product } from "@/lib/types";
import { OpportunityScore } from "./opportunity-score";

interface ProductCardProps {
  product: Product;
}

const competitionColor: Record<string, string> = {
  Low: "text-green-600",
  Medium: "text-yellow-600",
  High: "text-red-600",
};

const demandColor: Record<string, string> = {
  Low: "text-red-600",
  Medium: "text-yellow-600",
  High: "text-green-600",
};

export function ProductCard({ product }: ProductCardProps) {
  const {
    name,
    category,
    image_url,
    price,
    opportunity_score,
    competition_rating,
    demand_rating,
  } = product;

  return (
    <div className="group rounded-xl border border-gray-200 bg-white shadow-sm hover:shadow-md transition-shadow overflow-hidden">
      {/* Image */}
      <div className="relative aspect-square bg-gray-100 overflow-hidden">
        <img
          src={image_url}
          alt={name}
          className="h-full w-full object-cover group-hover:scale-105 transition-transform duration-300"
          loading="lazy"
          onError={(e) => {
            (e.target as HTMLImageElement).src =
              "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='200' height='200' fill='%23f1f5f9'%3E%3Crect width='200' height='200'/%3E%3Ctext x='50%25' y='50%25' dominant-baseline='middle' text-anchor='middle' fill='%2394a3b8' font-size='14'%3ENo Image%3C/text%3E%3C/svg%3E";
          }}
        />
        <div className="absolute top-2 left-2">
          <OpportunityScore score={opportunity_score} />
        </div>
      </div>

      {/* Content */}
      <div className="p-3 space-y-2">
        <span className="inline-block rounded bg-gray-100 px-1.5 py-0.5 text-[10px] font-medium text-gray-600 uppercase tracking-wide">
          {category}
        </span>

        <h3 className="text-sm font-semibold text-gray-900 line-clamp-2 leading-snug">
          {name}
        </h3>

        <div className="flex items-center justify-between">
          <span className="text-lg font-bold text-gray-900">
            ${price.toFixed(2)}
          </span>
        </div>

        {/* Competition & Demand indicators */}
        <div className="flex items-center gap-3 text-xs">
          <span className={competitionColor[competition_rating] ?? "text-gray-500"}>
            🏪 {competition_rating} competition
          </span>
          <span className={demandColor[demand_rating] ?? "text-gray-500"}>
            📈 {demand_rating} demand
          </span>
        </div>
      </div>
    </div>
  );
}

export function ProductCardSkeleton() {
  return (
    <div className="rounded-xl border border-gray-200 bg-white overflow-hidden animate-pulse">
      <div className="aspect-square bg-gray-200" />
      <div className="p-3 space-y-2">
        <div className="h-4 w-16 bg-gray-200 rounded" />
        <div className="h-4 w-full bg-gray-200 rounded" />
        <div className="h-4 w-3/4 bg-gray-200 rounded" />
        <div className="flex gap-3">
          <div className="h-3 w-24 bg-gray-200 rounded" />
          <div className="h-3 w-20 bg-gray-200 rounded" />
        </div>
      </div>
    </div>
  );
}
