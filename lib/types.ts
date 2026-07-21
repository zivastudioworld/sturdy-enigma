export interface Product {
  id: string;
  name: string;
  description: string;
  category: string;
  image_url: string;
  price: number;
  source_platform: string;
  source_url: string;
  opportunity_score: number;
  competition_rating: "Low" | "Medium" | "High";
  demand_rating: "Low" | "Medium" | "High";
  profit_margin_estimate: number;
  trend_direction: "up" | "down" | "stable";
  ai_launch_plan?: string;
  created_at: string;
  updated_at: string;
}

export interface ProductSearchParams {
  query?: string;
  category?: string;
  minScore?: number;
  maxScore?: number;
  sortBy?: "opportunity_score" | "price" | "trend" | "created_at";
  sortOrder?: "asc" | "desc";
  limit?: number;
  offset?: number;
}
