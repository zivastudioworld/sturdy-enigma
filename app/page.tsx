import Link from "next/link";

export default function HomePage() {
  return (
    <main className="flex-1 flex flex-col items-center justify-center px-4">
      <div className="max-w-2xl text-center space-y-8">
        <h1 className="text-5xl sm:text-6xl font-bold tracking-tight text-brand-600">
          Scoutify AI
        </h1>
        <p className="text-xl sm:text-2xl text-gray-600 leading-relaxed">
          Find products worth selling before everyone else.
        </p>
        <p className="text-gray-500 max-w-lg mx-auto">
          AI-powered product research for dropshippers. Search across platforms,
          get opportunity scores, and launch with confidence.
        </p>
        <div className="flex gap-4 justify-center">
          <Link
            href="/login"
            className="rounded-lg bg-brand-600 px-6 py-3 text-white font-medium hover:bg-brand-700 transition-colors"
          >
            Get Started
          </Link>
          <a
            href="#features"
            className="rounded-lg border border-gray-300 px-6 py-3 text-gray-700 font-medium hover:bg-gray-50 transition-colors"
          >
            Learn More
          </a>
        </div>
      </div>
    </main>
  );
}
