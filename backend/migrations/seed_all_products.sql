-- Seed all products for El Kheima Beach Resort
-- This includes: Packages (Restaurant & Cafe), Activities (Water Sports & Beach Entry), and Events

-- ============================================
-- 1. PACKAGES (Restaurant & Cafe)
-- ============================================

-- Restaurant Packages
INSERT INTO products (name, name_ar, description, description_ar, type, price, image_url, duration, is_active) VALUES
('Pizza Night Offer', 'ليلة البيتزا', 'Large Pizza + Soft Drinks + Salad', 'بيتزا كبيرة + مشروبات غازية + سلطة', 'restaurant', 250.00, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2070', 90, TRUE),
('Candlelight Beach Dinner', 'عشاء رومانسي على الشاطئ', 'Romantic Dinner on Beach + Candles + Sunset View', 'عشاء رومانسي على الشاطئ + شموع + إطلالة الغروب', 'restaurant', 650.00, 'https://images.unsplash.com/photo-1470229538611-16ba8c7ffbd7?q=80&w=2070', 120, TRUE),
('Sunset Romantic Setup', 'إعداد رومانسي عند الغروب', 'Private Table + Decorations + Photographer', 'طاولة خاصة + ديكورات + مصور', 'restaurant', 800.00, 'https://images.unsplash.com/photo-1495954484750-af469f2f9be5?q=80&w=2070', 150, TRUE),
('Romantic Dinner for Two', 'عشاء رومانسي لشخصين', 'Dinner for Two + Candles + Live Music', 'عشاء لشخصين + شموع + موسيقى حية', 'restaurant', 500.00, 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?q=80&w=2070', 120, TRUE),
('Pasta + Drink Combo', 'كومبو الباستا', 'Pasta + Drink + Garlic Bread', 'باستا + مشروب + خبز بالثوم', 'restaurant', 180.00, 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?q=80&w=2070', 45, TRUE)
ON CONFLICT DO NOTHING;

-- Cafe Packages
INSERT INTO products (name, name_ar, description, description_ar, type, price, image_url, duration, is_active) VALUES
('Morning Coffee Package', 'باقة القهوة الصباحية', 'Coffee + Croissant + Orange Juice', 'قهوة + كرواسون + عصير برتقال', 'cafe', 80.00, 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?q=80&w=2070', 30, TRUE),
('Sunset Drink Offer', 'عرض الغروب', 'Signature Drink + Dessert + Sunset View', 'مشروب مميز + حلى + إطلالة الغروب', 'cafe', 120.00, 'https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?q=80&w=2070', 45, TRUE),
('Hookah & Lounge', 'شيشة ولاونج', 'Premium Hookah + Drink + Cozy Seating', 'شيشة فاخرة + مشروب + جلسة مريحة', 'cafe', 150.00, 'https://images.unsplash.com/photo-1528698827591-e19ccd7bc23d?q=80&w=2070', 60, TRUE)
ON CONFLICT DO NOTHING;

-- ============================================
-- 2. ACTIVITIES (Water Sports & Beach Entry)
-- ============================================

-- Water Sports
INSERT INTO products (name, name_ar, description, description_ar, type, price, image_url, duration, is_active) VALUES
('Jet Ski Adventure', 'مغامرة الجت سكي', 'Thrilling jet ski ride on the Red Sea', 'رحلة جت سكي مثيرة على البحر الأحمر', 'water_sports', 200.00, 'https://images.unsplash.com/photo-1530870110042-98b2cb110834?w=800', 30, TRUE),
('Parasailing Experience', 'تجربة الباراسيلينج', 'Fly high above the beautiful Red Sea', 'حلق عالياً فوق البحر الأحمر الجميل', 'water_sports', 300.00, 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800', 20, TRUE),
('Banana Boat Ride', 'رحلة القارب الموز', 'Fun banana boat ride for the whole family', 'رحلة قارب الموز الممتعة للعائلة', 'water_sports', 150.00, 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800', 15, TRUE),
('Snorkeling Trip', 'رحلة الغطس', 'Explore the underwater world of the Red Sea', 'استكشف العالم تحت الماء في البحر الأحمر', 'water_sports', 250.00, 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800', 120, TRUE),
('Scuba Diving', 'الغوص', 'Professional scuba diving with instructor', 'غوص احترافي مع مدرب', 'water_sports', 400.00, 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800', 180, TRUE),
('Kayaking', 'التجديف', 'Peaceful kayaking along the coast', 'تجديف هادئ على طول الساحل', 'water_sports', 100.00, 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800', 60, TRUE)
ON CONFLICT DO NOTHING;

-- Beach Entry
INSERT INTO products (name, name_ar, description, description_ar, type, price, image_url, duration, is_active) VALUES
('Beach Day Pass', 'تذكرة دخول الشاطئ', 'Full day access to our private beach with sunbed', 'دخول ليوم كامل لشاطئنا الخاص مع كرسي استلقاء', 'beach_entry', 100.00, 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800', 480, TRUE),
('VIP Beach Cabana', 'كابانا الشاطئ VIP', 'Private beach cabana with waiter service', 'كابانا خاصة على الشاطئ مع خدمة نادل', 'beach_entry', 500.00, 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800', 480, TRUE),
('Family Beach Package', 'باقة الشاطئ العائلية', 'Beach access for 4 people with 2 sunbeds and umbrella', 'دخول الشاطئ لـ 4 أشخاص مع 2 كرسي استلقاء ومظلة', 'beach_entry', 300.00, 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800', 480, TRUE)
ON CONFLICT DO NOTHING;

-- ============================================
-- 3. EVENTS (Weddings, Corporate, Birthday, Special)
-- ============================================

-- Update existing events or insert new ones
INSERT INTO events (name, name_ar, description, description_ar, category, price, image_url, duration, max_guests, location, location_ar, is_active) VALUES
('Wedding Celebration', 'حفل زفاف', 'Celebrate your special day on our private beach with stunning views', 'احتفل بيومك الخاص على شاطئنا الخاص مع إطلالة خلابة', 'wedding', 5000.00, 'https://images.unsplash.com/photo-1519741497674-611481863552?q=80&w=800', 300, 200, 'Private Beach', 'الشاطئ الخاص', TRUE),
('Corporate Event', 'فعالية شركات', 'Professional conferences and workshops with all facilities', 'مؤتمرات وورش عمل احترافية مع كل المرافق', 'corporate', 3000.00, 'https://images.unsplash.com/photo-1511578314322-379afb476865?q=80&w=800', 240, 100, 'Conference Hall', 'قاعة المؤتمرات', TRUE),
('Birthday Party', 'حفلة عيد ميلاد', 'Special celebrations for kids and adults with amazing decorations', 'احتفالات مميزة للأطفال والكبار مع ديكورات رائعة', 'birthday', 1500.00, 'https://images.unsplash.com/photo-1530103862676-de8c9debad1d?q=80&w=800', 180, 50, 'Event Hall', 'قاعة الفعاليات', TRUE),
('Special Occasion', 'مناسبة خاصة', 'Engagement, anniversary, or any special celebration', 'خطوبة، ذكرى سنوية، أو أي احتفال خاص', 'special', 2000.00, 'https://images.unsplash.com/photo-1464366400600-7168b8af9bc3?q=80&w=800', 240, 100, 'Grand Hall', 'القاعة الكبرى', TRUE),
('Morning Yoga', 'يوجا الصباح', 'Daily beach yoga sessions with professional instructors', 'جلسات يوجا يومية على الشاطئ مع مدربين محترفين', 'yoga', 25.00, 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400&q=80', 60, 20, 'Beach', 'الشاطئ', TRUE),
('Evening Zumba', 'زومبا مسائية', 'High-energy Zumba classes full of fun', 'حصص زومبا مليئة بالطاقة والمرح', 'zumba', 20.00, 'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=400&q=80', 45, 30, 'Gym Hall', 'قاعة الرياضة', TRUE)
ON CONFLICT DO NOTHING;

-- ============================================
-- Create indexes for better performance
-- ============================================

CREATE INDEX IF NOT EXISTS idx_products_type ON products(type);
CREATE INDEX IF NOT EXISTS idx_products_is_active ON products(is_active);
CREATE INDEX IF NOT EXISTS idx_events_category ON events(category);
CREATE INDEX IF NOT EXISTS idx_events_is_active ON events(is_active);

-- ============================================
-- Verification Query
-- ============================================

-- Count products by type
SELECT 
    type,
    COUNT(*) as count,
    SUM(CASE WHEN is_active THEN 1 ELSE 0 END) as active_count
FROM products
GROUP BY type
ORDER BY type;

-- Count events by category
SELECT 
    category,
    COUNT(*) as count,
    SUM(CASE WHEN is_active THEN 1 ELSE 0 END) as active_count
FROM events
GROUP BY category
ORDER BY category;
