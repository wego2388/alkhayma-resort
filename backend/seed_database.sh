#!/bin/bash

# El Kheima Beach Resort - Database Seeding Script
# This script seeds all products and events into the database

echo "🌊 El Kheima Beach Resort - Database Seeding"
echo "=============================================="
echo ""

# Load environment variables
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
else
    echo "❌ Error: .env file not found"
    exit 1
fi

# Database connection details
DB_HOST="${DB_HOST:-localhost}"
DB_PORT="${DB_PORT:-5432}"
DB_NAME="${DB_NAME:-alkhayma_db}"
DB_USER="${DB_USER:-postgres}"

echo "📊 Database: $DB_NAME"
echo "🖥️  Host: $DB_HOST:$DB_PORT"
echo "👤 User: $DB_USER"
echo ""

# Check if PostgreSQL is running
echo "🔍 Checking PostgreSQL connection..."
if ! pg_isready -h $DB_HOST -p $DB_PORT -U $DB_USER > /dev/null 2>&1; then
    echo "❌ Error: Cannot connect to PostgreSQL"
    echo "   Make sure PostgreSQL is running and credentials are correct"
    exit 1
fi
echo "✅ PostgreSQL is running"
echo ""

# Run the seed script
echo "🌱 Seeding database with products and events..."
PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f migrations/seed_all_products.sql

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Database seeded successfully!"
    echo ""
    echo "📊 Summary:"
    echo "   - Restaurant Packages: 5"
    echo "   - Cafe Packages: 3"
    echo "   - Water Sports: 6"
    echo "   - Beach Entry: 3"
    echo "   - Events: 6"
    echo ""
    echo "🎉 Total: 23 products/events added"
    echo ""
    echo "🔗 Test the API:"
    echo "   curl http://localhost:8000/api/products?type=restaurant"
    echo "   curl http://localhost:8000/api/products?type=water_sports"
    echo "   curl http://localhost:8000/api/events?category=wedding"
else
    echo ""
    echo "❌ Error: Failed to seed database"
    exit 1
fi
