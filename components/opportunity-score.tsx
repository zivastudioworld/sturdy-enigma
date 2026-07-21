interface OpportunityScoreProps {
  score: number;
  size?: "sm" | "md";
}

export function OpportunityScore({ score, size = "sm" }: OpportunityScoreProps) {
  const colorClass =
    score >= 80
      ? "bg-green-100 text-green-800 border-green-300"
      : score >= 60
        ? "bg-yellow-100 text-yellow-800 border-yellow-300"
        : "bg-red-100 text-red-800 border-red-300";

  const sizeClass = size === "md" ? "px-2.5 py-1 text-sm" : "px-2 py-0.5 text-xs";

  return (
    <span
      className={`inline-flex items-center gap-1 rounded-full border font-semibold ${colorClass} ${sizeClass}`}
      title={`Opportunity Score: ${score}/100`}
    >
      <span className="relative flex h-2 w-2">
        <span
          className={`absolute inline-flex h-full w-full rounded-full opacity-75 ${
            score >= 80 ? "bg-green-500" : score >= 60 ? "bg-yellow-500" : "bg-red-500"
          }`}
        />
      </span>
      {score}
    </span>
  );
}
