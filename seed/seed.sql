-- Scoutify AI: Seed Data (25 mock products across 8 categories)
-- Run this after the initial schema migration to populate development data.

insert into products (title, description, image_url, category, platform, source_url, price, currency, opportunity_score, competition_level, demand_level, profit_margin_estimate, trend_direction) values

-- HOME & KITCHEN (3 products)
('Magnetic Spice Rack Organizer',
 'Space-saving magnetic spice rack that mounts to fridge or wall. Holds 12 jars, rotates 360°, heavy-duty magnets. Perfect for small kitchens.',
 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600',
 'Home & Kitchen', 'Amazon', 'https://amazon.com/dp/B0EXAMPLE1', 29.99, 'USD', 87, 'low', 'high', 68.00, 'rising'),

('Silicone Collapsible Colander Set',
 'Set of 3 BPA-free silicone colanders that collapse flat for storage. Heat-resistant up to 400°F, dishwasher safe, non-slip base.',
 'https://images.unsplash.com/photo-1585238342024-78d387f4a707?w=600',
 'Home & Kitchen', 'AliExpress', 'https://aliexpress.com/item/example2', 19.99, 'USD', 78, 'medium', 'high', 72.00, 'rising'),

('Smart LED Under-Cabinet Lights',
 'Motion-sensor LED strip lights with wireless remote, USB rechargeable, 3 color modes, easy peel-and-stick installation.',
 'https://images.unsplash.com/photo-1565814636199-ae8133055c1c?w=600',
 'Home & Kitchen', 'Amazon', 'https://amazon.com/dp/B0EXAMPLE3', 34.99, 'USD', 91, 'low', 'high', 65.00, 'rising'),

-- ELECTRONICS (3 products)
('Wireless Bluetooth Sleep Mask',
 'Ultra-thin sleep mask with built-in Bluetooth speakers. 10-hour battery life, washable microfiber, blocks 100% of light. Ideal for travel and side sleepers.',
 'https://images.unsplash.com/photo-1620325867502-221cfb5faa5f?w=600',
 'Electronics', 'TikTok Shop', 'https://tiktok.com/shop/example4', 24.99, 'USD', 93, 'medium', 'high', 70.00, 'rising'),

('Mini Projector with WiFi 6',
 'Portable 1080p HD projector with built-in streaming apps, auto keystone correction, and 200" display. Weighs under 2 lbs.',
 'https://images.unsplash.com/photo-1615811361523-6bd0393a5d3c?w=600',
 'Electronics', 'AliExpress', 'https://aliexpress.com/item/example5', 89.99, 'USD', 82, 'medium', 'high', 55.00, 'rising'),

('Magnetic Phone Car Mount',
 'Dual-locking magnet mount for dashboard and vent. Universal fit, 360° rotation, holds phones up to 6.7". One-hand operation.',
 'https://images.unsplash.com/photo-1586953208448-b95a79798f07?w=600',
 'Electronics', 'Amazon', 'https://amazon.com/dp/B0EXAMPLE6', 14.99, 'USD', 85, 'high', 'high', 60.00, 'stable'),

-- FASHION (3 products)
('Compression Packing Cubes for Travel',
 'Set of 6 lightweight cubes with premium double zippers. Water-resistant nylon, expands 3x when packed. Color-coded for organization.',
 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=600',
 'Fashion', 'TikTok Shop', 'https://tiktok.com/shop/example7', 27.99, 'USD', 88, 'low', 'high', 66.00, 'rising'),

('Retro Polarized Aviator Sunglasses',
 'Vintage-style metal frame aviators with UV400 protection. Scratch-resistant lenses, spring hinges, included hard case and cloth.',
 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=600',
 'Fashion', 'AliExpress', 'https://aliexpress.com/item/example8', 12.99, 'USD', 76, 'high', 'medium', 73.00, 'stable'),

('Posture Correcting Sports Bra',
 'Wireless bra with criss-cross back support that gently pulls shoulders back. Moisture-wicking fabric, 4-way stretch. Suitable for daily wear.',
 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=600',
 'Fashion', 'Amazon', 'https://amazon.com/dp/B0EXAMPLE9', 22.99, 'USD', 84, 'medium', 'high', 62.00, 'rising'),

-- BEAUTY (4 products)
('Dermaplaning Razor Facial Set',
 'Professional 12-piece stainless steel dermaplaning tool kit. Removes peach fuzz and dead skin, includes replacement blades and travel case.',
 'https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?w=600',
 'Beauty', 'TikTok Shop', 'https://tiktok.com/shop/example10', 9.99, 'USD', 95, 'low', 'high', 78.00, 'rising'),

('Hyaluronic Acid Serum 3-Pack',
 'Triple-action anti-aging serum with 2% hyaluronic acid, vitamin C, and retinol. Non-greasy, dermatologist-tested, cruelty-free.',
 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=600',
 'Beauty', 'Amazon', 'https://amazon.com/dp/B0EXAMPLE11', 29.99, 'USD', 79, 'high', 'high', 58.00, 'stable'),

('Rose Quartz Gua Sha Facial Tool',
 'Authentic rose quartz gua sha stone with acupressure guide. Reduces puffiness, sculpts jawline, includes storage pouch and 21-day routine card.',
 'https://images.unsplash.com/photo-1611930022073-b7a4ba5fcccd?w=600',
 'Beauty', 'AliExpress', 'https://aliexpress.com/item/example12', 8.99, 'USD', 82, 'medium', 'high', 80.00, 'rising'),

('LED Light Therapy Face Mask',
 '7-color LED phototherapy mask for acne, wrinkles, and hyperpigmentation. Wireless, comfortable silicone, 20-minute auto shut-off.',
 'https://images.unsplash.com/photo-1596755389378-c31d21fd1273?w=600',
 'Beauty', 'Amazon', 'https://amazon.com/dp/B0EXAMPLE13', 59.99, 'USD', 90, 'medium', 'high', 60.00, 'rising'),

-- FITNESS (3 products)
('Adjustable Ankle Weights Set',
 'Pair of adjustable ankle/wrist weights (1-5 lbs each). Breathable neoprene, secure velcro straps, reflective trim for outdoor use.',
 'https://images.unsplash.com/photo-1601422407692-ec4eeec1d9b3?w=600',
 'Fitness', 'Amazon', 'https://amazon.com/dp/B0EXAMPLE14', 24.99, 'USD', 70, 'medium', 'medium', 55.00, 'stable'),

('Ab Roller Wheel with Knee Pad',
 'Dual-wheel ab roller with auto-rebound mechanism. Includes thick knee pad, non-slip handles, and workout guide. Supports up to 440 lbs.',
 'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?w=600',
 'Fitness', 'AliExpress', 'https://aliexpress.com/item/example15', 17.99, 'USD', 75, 'high', 'medium', 67.00, 'stable'),

('Smart Jump Rope with App',
 'Cordless jump rope with weighted handles and fitness app sync. Tracks jumps, calories, and time. Adjustable weight and bluetooth connectivity.',
 'https://images.unsplash.com/photo-1605296867424-35fc25c9212a?w=600',
 'Fitness', 'TikTok Shop', 'https://tiktok.com/shop/example16', 19.99, 'USD', 86, 'low', 'high', 71.00, 'rising'),

-- PETS (3 products)
('Self-Cleaning Cat Litter Box',
 'Automatic sifting litter box with quiet motor, odor control carbon filter, and safety sensors. Works with clumping litter. Easy disassembly for cleaning.',
 'https://images.unsplash.com/photo-1583511655826-05700442b31b?w=600',
 'Pets', 'Amazon', 'https://amazon.com/dp/B0EXAMPLE17', 149.99, 'USD', 88, 'medium', 'high', 45.00, 'rising'),

('Slow Feeder Dog Bowl Puzzle',
 'Interactive maze bowl slows dogs'' eating by 10x. Non-slip base, BPA-free, dishwasher safe. Suitable for all breeds. Available in 3 sizes.',
 'https://images.unsplash.com/photo-1601758228041-f3b2795255f1?w=600',
 'Pets', 'AliExpress', 'https://aliexpress.com/item/example18', 14.99, 'USD', 81, 'low', 'high', 75.00, 'rising'),

('Pet Hair Remover Roller',
 'Reusable lint roller that collects pet hair without sticky sheets. Works on furniture, clothing, and car seats. Just rinse to clean.',
 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?w=600',
 'Pets', 'TikTok Shop', 'https://tiktok.com/shop/example19', 11.99, 'USD', 94, 'low', 'high', 77.00, 'rising'),

-- BABY & KIDS (3 products)
('Silicone Baby Food Dispensing Spoon',
 'All-in-one squeeze spoon with measured reservoir. Holds 3 oz of puree, leak-proof cap, soft silicone tip for teething. Travel-friendly.',
 'https://images.unsplash.com/photo-1606293926072-5f8c36aad6a2?w=600',
 'Baby & Kids', 'Amazon', 'https://amazon.com/dp/B0EXAMPLE20', 8.99, 'USD', 83, 'low', 'high', 79.00, 'rising'),

('Muslin Swaddle Blankets 4-Pack',
 'Premium bamboo muslin swaddles, 47x47 inches, breathable and pre-washed. Neutral colors, versatile nursing cover, stroller cover, or burp cloth.',
 'https://images.unsplash.com/photo-1555252333-9f8e92e65df9?w=600',
 'Baby & Kids', 'AliExpress', 'https://aliexpress.com/item/example21', 18.99, 'USD', 69, 'high', 'medium', 65.00, 'stable'),

('Electric Nail Trimmer for Babies',
 'Safe LED-lit nail file with 6 grinding heads for newborns to toddlers. Whisper-quiet motor, gentle oscillation, USB rechargeable.',
 'https://images.unsplash.com/photo-1519689680058-324335c77eba?w=600',
 'Baby & Kids', 'TikTok Shop', 'https://tiktok.com/shop/example22', 15.99, 'USD', 89, 'low', 'high', 70.00, 'rising'),

-- OFFICE (3 products)
('Laptop Stand with Wireless Charger',
 'Adjustable aluminum laptop stand with integrated 15W wireless phone charger. Ergonomic height, anti-slip silicone pads, folds flat for travel.',
 'https://images.unsplash.com/photo-1611186871348-b1ce696e52cc?w=600',
 'Office', 'Amazon', 'https://amazon.com/dp/B0EXAMPLE23', 49.99, 'USD', 84, 'medium', 'high', 58.00, 'rising'),

('Noise-Cancelling Office Pod Light',
 'Circular desk light with 18 noise-absorbing foam panels that create a personal sound shield. 3 brightness levels, warm to cool light, USB powered.',
 'https://images.unsplash.com/photo-1529539795054-3c162aab037a?w=600',
 'Office', 'AliExpress', 'https://aliexpress.com/item/example24', 39.99, 'USD', 72, 'medium', 'medium', 50.00, 'stable'),

('Adjustable Standing Desk Converter',
 'Spring-loaded sit-stand desk riser for dual monitors. 36" wide, holds 35 lbs, 12 height positions, integrated keyboard tray. No tools required.',
 'https://images.unsplash.com/photo-1593642632559-0c6d3fc62b89?w=600',
 'Office', 'Amazon', 'https://amazon.com/dp/B0EXAMPLE25', 129.99, 'USD', 77, 'medium', 'high', 48.00, 'rising');
