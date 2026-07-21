const CATEGORIES: { label: string; emoji: string }[] = [
  { label: "Home & Kitchen", emoji: "🏠" },
  { label: "Electronics", emoji: "🔌" },
  { label: "Fashion", emoji: "👕" },
  { label: "Beauty", emoji: "💄" },
  { label: "Fitness", emoji: "💪" },
  { label: "Pets", emoji: "🐾" },
  { label: "Baby & Kids", emoji: "👶" },
  { label: "Office", emoji: "🏢" },
];

interface CategoryBarProps {
  active: string | null;
  onChange: (category: string | null) => void;
}

export function CategoryBar({ active, onChange }: CategoryBarProps) {
  return (
    <div className="flex gap-2 overflow-x-auto pb-2 scrollbar-hide -mx-1 px-1">
      {/* "All" button */}
      <button
        type="button"
        onClick={() => onChange(null)}
        className={`flex-shrink-0 rounded-full px-4 py-2 text-sm font-medium transition-colors border ${
          active === null
            ? "bg-brand-600 text-white border-brand-600"
            : "bg-white text-gray-700 border-gray-300 hover:border-brand-300 hover:text-brand-600"
        }`}
      >
        All
      </button>

      {CATEGORIES.map(({ label, emoji }) => (
        <button
          key={label}
          type="button"
          onClick={() => onChange(label)}
          className={`flex-shrink-0 rounded-full px-4 py-2 text-sm font-medium transition-colors border whitespace-nowrap ${
            active === label
              ? "bg-brand-600 text-white border-brand-600"
              : "bg-white text-gray-700 border-gray-300 hover:border-brand-300 hover:text-brand-600"
          }`}
        >
          <span className="mr-1.5">{emoji}</span>
          {label}
        </button>
      ))}
    </div>
  );
}
