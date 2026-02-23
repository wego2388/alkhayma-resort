-- Seed Data for Al Khayma Resort
-- Run after schema.sql

-- Insert admin user (password: admin123)
INSERT INTO users (email, password_hash, full_name, phone, role) VALUES
('admin@alkhayma.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYIq.Zu3u8u', 'Admin User', '+966501234567', 'admin'),
('customer@example.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYIq.Zu3u8u', 'محمد أحمد', '+966509876543', 'customer');

-- Insert rooms
INSERT INTO rooms (name, name_ar, description, description_ar, type, capacity, base_price, image_url, amenities) VALUES
('Deluxe Sea View', 'غرفة ديلوكس بإطلالة بحرية', 'Spacious room with stunning sea views, king-size bed, and modern amenities', 'غرفة واسعة مع إطلالة بحرية خلابة، سرير كينج سايز، ووسائل راحة حديثة', 'deluxe', 2, 450.00, '/images/rooms/deluxe-sea.jpg', '["WiFi", "TV", "AC", "Mini Bar", "Sea View"]'),
('Family Suite', 'جناح عائلي', 'Perfect for families with 2 bedrooms, living area, and private balcony', 'مثالي للعائلات مع غرفتي نوم، منطقة معيشة، وشرفة خاصة', 'suite', 4, 750.00, '/images/rooms/family-suite.jpg', '["WiFi", "TV", "AC", "Kitchen", "Balcony"]'),
('Standard Room', 'غرفة قياسية', 'Comfortable room with essential amenities and garden view', 'غرفة مريحة مع وسائل الراحة الأساسية وإطلالة على الحديقة', 'standard', 2, 300.00, '/images/rooms/standard.jpg', '["WiFi", "TV", "AC"]'),
('Presidential Suite', 'الجناح الرئاسي', 'Luxurious suite with panoramic views, jacuzzi, and premium services', 'جناح فاخر مع إطلالات بانورامية، جاكوزي، وخدمات مميزة', 'presidential', 4, 1500.00, '/images/rooms/presidential.jpg', '["WiFi", "TV", "AC", "Jacuzzi", "Butler Service", "Sea View"]'),
('Beach Bungalow', 'بنغل شاطئي', 'Direct beach access with private terrace and outdoor shower', 'وصول مباشر للشاطئ مع تراس خاص ودش خارجي', 'bungalow', 2, 650.00, '/images/rooms/bungalow.jpg', '["WiFi", "TV", "AC", "Beach Access", "Outdoor Shower"]');

-- Insert restaurant products
INSERT INTO products (name, name_ar, description, description_ar, type, price, image_url) VALUES
('Grilled Sea Bass', 'سمك قاروص مشوي', 'Fresh sea bass grilled to perfection with herbs and lemon', 'سمك قاروص طازج مشوي بالأعشاب والليمون', 'restaurant', 85.00, '/images/food/sea-bass.jpg'),
('Mixed Grill Platter', 'مشويات مشكلة', 'Assorted grilled meats with rice and salad', 'تشكيلة من اللحوم المشوية مع الأرز والسلطة', 'restaurant', 120.00, '/images/food/mixed-grill.jpg'),
('Seafood Pasta', 'باستا بالمأكولات البحرية', 'Creamy pasta with fresh seafood and garlic', 'باستا كريمية مع المأكولات البحرية الطازجة والثوم', 'restaurant', 75.00, '/images/food/seafood-pasta.jpg'),
('Arabic Mezze Set', 'سيت مقبلات عربية', 'Traditional Arabic appetizers including hummus, tabbouleh, and more', 'مقبلات عربية تقليدية تشمل الحمص والتبولة وغيرها', 'restaurant', 55.00, '/images/food/mezze.jpg');

-- Insert cafe products
INSERT INTO products (name, name_ar, description, description_ar, type, price, image_url) VALUES
('Cappuccino', 'كابتشينو', 'Italian style cappuccino with rich foam', 'كابتشينو إيطالي مع رغوة غنية', 'cafe', 18.00, '/images/cafe/cappuccino.jpg'),
('Fresh Orange Juice', 'عصير برتقال طازج', 'Freshly squeezed orange juice', 'عصير برتقال طازج معصور', 'cafe', 22.00, '/images/cafe/orange-juice.jpg'),
('Chocolate Cake', 'كيك شوكولاتة', 'Rich chocolate cake with ganache', 'كيك شوكولاتة غني بالجاناش', 'cafe', 35.00, '/images/cafe/chocolate-cake.jpg'),
('Arabic Coffee', 'قهوة عربية', 'Traditional Arabic coffee with dates', 'قهوة عربية تقليدية مع التمر', 'cafe', 15.00, '/images/cafe/arabic-coffee.jpg');

-- Insert activities
INSERT INTO products (name, name_ar, description, description_ar, type, price, duration, image_url) VALUES
('Scuba Diving', 'غوص سكوبا', 'Explore underwater world with certified instructor', 'استكشف العالم تحت الماء مع مدرب معتمد', 'water_sports', 250.00, 120, '/images/activities/scuba.jpg'),
('Jet Ski Rental', 'تأجير جت سكي', '30 minutes of thrilling jet ski experience', '30 دقيقة من تجربة الجت سكي المثيرة', 'water_sports', 180.00, 30, '/images/activities/jetski.jpg'),
('Beach Volleyball', 'كرة طائرة شاطئية', 'Join beach volleyball games with other guests', 'انضم لألعاب الكرة الطائرة الشاطئية مع الضيوف الآخرين', 'beach', 0.00, 60, '/images/activities/volleyball.jpg'),
('Sunset Boat Tour', 'جولة بحرية عند الغروب', 'Romantic boat tour during sunset', 'جولة بحرية رومانسية عند الغروب', 'activities', 350.00, 90, '/images/activities/boat-tour.jpg'),
('Spa Massage', 'مساج سبا', 'Relaxing full body massage', 'مساج كامل للجسم للاسترخاء', 'activities', 280.00, 60, '/images/activities/spa.jpg'),
('Desert Safari', 'رحلة سفاري صحراوية', 'Exciting desert adventure with BBQ dinner', 'مغامرة صحراوية مثيرة مع عشاء شواء', 'activities', 420.00, 240, '/images/activities/safari.jpg');

-- Insert sample bookings
INSERT INTO bookings (user_id, room_id, booking_type, check_in, check_out, guests, total_price, status) VALUES
(2, 1, 'room', '2026-03-01', '2026-03-05', 2, 1800.00, 'confirmed'),
(2, 3, 'room', '2026-03-15', '2026-03-18', 2, 900.00, 'pending');

INSERT INTO bookings (user_id, product_id, booking_type, booking_date, guests, total_price, status) VALUES
(2, 9, 'water_sports', '2026-03-02 10:00:00', 1, 250.00, 'confirmed'),
(2, 12, 'activities', '2026-03-03 17:00:00', 2, 350.00, 'confirmed');

-- Insert sample payments
INSERT INTO payments (booking_id, amount, payment_method, status, transaction_id) VALUES
(1, 1800.00, 'credit_card', 'completed', 'TXN-2026-001'),
(3, 250.00, 'credit_card', 'completed', 'TXN-2026-002');

-- Insert sample reviews
INSERT INTO reviews (user_id, room_id, rating, comment, comment_ar, is_approved) VALUES
(2, 1, 5, 'Amazing room with beautiful sea view!', 'غرفة رائعة مع إطلالة بحرية جميلة!', true),
(2, 3, 4, 'Good value for money, clean and comfortable', 'قيمة جيدة مقابل المال، نظيفة ومريحة', true);
