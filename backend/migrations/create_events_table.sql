-- Create events table
CREATE TABLE IF NOT EXISTS events (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    name_ar VARCHAR(255) NOT NULL,
    description TEXT,
    description_ar TEXT,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    image_url TEXT,
    duration INTEGER,
    schedule_time VARCHAR(50),
    schedule_days VARCHAR(100),
    max_guests INTEGER,
    location VARCHAR(255),
    location_ar VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample events
INSERT INTO events (name, name_ar, description, description_ar, category, price, image_url, duration, schedule_time, schedule_days, max_guests, location, location_ar) VALUES
('Morning Yoga', 'يوجا الصباح', 'Daily beach yoga sessions with professional instructors', 'جلسات يوجا يومية على الشاطئ مع مدربين محترفين', 'yoga', 25.00, 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400&q=80', 60, '7:00 AM', 'Sunday,Tuesday,Thursday', 20, 'Beach', 'الشاطئ'),
('Evening Zumba', 'زومبا مسائية', 'High-energy Zumba classes full of fun', 'حصص زومبا مليئة بالطاقة والمرح', 'zumba', 20.00, 'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=400&q=80', 45, '6:00 PM', 'Monday,Thursday', 30, 'Gym Hall', 'قاعة الرياضة'),
('Birthday Party', 'حفلة عيد ميلاد', 'Luxury birthday celebrations with custom decor', 'احتفالات أعياد ميلاد فاخرة مع ديكور مخصص', 'birthday', 500.00, 'https://images.unsplash.com/photo-1530103862676-de8c9debad1d?w=400&q=80', 180, NULL, NULL, 50, 'Event Hall', 'قاعة الفعاليات'),
('Special Occasion', 'مناسبة خاصة', 'Engagement, wedding, graduation, or any special event', 'خطوبة، زفاف، تخرج، أو أي مناسبة خاصة', 'occasion', 2000.00, 'https://images.unsplash.com/photo-1519167758481-83f29da8c2b6?w=400&q=80', 240, NULL, NULL, 200, 'Grand Hall', 'القاعة الكبرى');

-- Create indexes
CREATE INDEX idx_events_category ON events(category);
CREATE INDEX idx_events_is_active ON events(is_active);
