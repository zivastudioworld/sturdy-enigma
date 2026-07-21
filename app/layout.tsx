import type { Metadata } from "next";
import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { AuthButtons } from "./auth-buttons";

export const metadata: Metadata = {
  title: "Scoutify AI — Find Products Worth Selling",
  description:
    "AI-powered product research for dropshippers. Find winning products before everyone else.",
};

export default async function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  return (
    <html lang="en">
      <body className="min-h-screen flex flex-col">
        <header className="border-b border-gray-200 bg-white">
          <div className="max-w-7xl mx-auto px-4 h-14 flex items-center justify-between">
            <Link href="/" className="text-lg font-bold text-brand-600">
              Scoutify AI
            </Link>
            <nav className="flex items-center gap-4">
              <AuthButtons user={user} />
            </nav>
          </div>
        </header>
        {children}
      </body>
    </html>
  );
}
