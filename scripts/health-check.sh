#!/bin/bash

# 🔍 Project Health Check Script
# Verifies project structure and files

echo "🔍 Al Khayma Resort - Project Health Check"
echo "=========================================="
echo ""

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counters
PASSED=0
FAILED=0

# Function to check file/folder exists
check_exists() {
    if [ -e "$1" ]; then
        echo -e "${GREEN}✓${NC} $2"
        ((PASSED++))
    else
        echo -e "${RED}✗${NC} $2 (Missing: $1)"
        ((FAILED++))
    fi
}

# Function to check file NOT exists
check_not_exists() {
    if [ ! -e "$1" ]; then
        echo -e "${GREEN}✓${NC} $2"
        ((PASSED++))
    else
        echo -e "${RED}✗${NC} $2 (Should not exist: $1)"
        ((FAILED++))
    fi
}

echo "📁 Checking Core Structure..."
check_exists "backend" "Backend folder"
check_exists "frontend" "Frontend folder"
check_exists "database" "Database folder"
check_exists "docs" "Documentation folder"
check_exists "scripts" "Scripts folder"
echo ""

echo "📄 Checking Documentation..."
check_exists "README.md" "README file"
check_exists "PROJECT_STRUCTURE.md" "Project structure doc"
check_exists "CLEANUP_REPORT.md" "Cleanup report"
check_exists ".gitignore" "Git ignore file"
echo ""

echo "🔧 Checking Backend Files..."
check_exists "backend/main.py" "Backend entry point"
check_exists "backend/requirements.txt" "Python dependencies"
check_exists "backend/app/api" "API routes folder"
check_exists "backend/app/models" "Models folder"
check_exists "backend/app/schemas" "Schemas folder"
echo ""

echo "🎨 Checking Frontend Files..."
check_exists "frontend/package.json" "Package.json"
check_exists "frontend/vite.config.ts" "Vite config"
check_exists "frontend/src/main.ts" "Frontend entry point"
check_exists "frontend/src/App.vue" "App component"
check_exists "frontend/src/router" "Router folder"
check_exists "frontend/src/stores" "Stores folder"
check_exists "frontend/src/i18n" "i18n folder"
check_exists "frontend/src/components" "Components folder"
check_exists "frontend/src/views" "Views folder"
echo ""

echo "🗑️ Checking Cleanup (should NOT exist)..."
check_not_exists "frontend/src/views/Home.old.vue" "Old Home.vue removed"
check_not_exists "frontend/src/views/Dashboard.old.vue" "Old Dashboard.vue removed"
check_not_exists "backend/backend.log" "Backend log removed"
check_not_exists "backend/app.py" "Duplicate app.py removed"
check_not_exists "test" "Test folder moved"
check_not_exists "deploy.sh" "Scripts moved to /scripts/"
echo ""

echo "📦 Checking Key Components..."
check_exists "frontend/src/components/Navbar.vue" "Navbar component"
check_exists "frontend/src/components/Footer.vue" "Footer component"
check_exists "frontend/src/components/LiveCounter.vue" "LiveCounter component"
check_exists "frontend/src/components/Toast.vue" "Toast component"
check_exists "frontend/src/components/RoomManager.vue" "RoomManager component"
check_exists "frontend/src/components/ProductManager.vue" "ProductManager component"
check_exists "frontend/src/components/BookingsManager.vue" "BookingsManager component"
echo ""

echo "📄 Checking Views..."
check_exists "frontend/src/views/Home.vue" "Home view"
check_exists "frontend/src/views/Rooms.vue" "Rooms view"
check_exists "frontend/src/views/Restaurant.vue" "Restaurant view"
check_exists "frontend/src/views/Activities.vue" "Activities view"
check_exists "frontend/src/views/Gallery.vue" "Gallery view"
check_exists "frontend/src/views/About.vue" "About view"
check_exists "frontend/src/views/Contact.vue" "Contact view"
check_exists "frontend/src/views/Dashboard.vue" "Dashboard view"
echo ""

echo "🔌 Checking API Routes..."
check_exists "backend/app/api/auth.py" "Auth API"
check_exists "backend/app/api/rooms.py" "Rooms API"
check_exists "backend/app/api/products.py" "Products API"
check_exists "backend/app/api/bookings.py" "Bookings API"
check_exists "backend/app/api/stats.py" "Stats API"
echo ""

echo "🌐 Checking i18n..."
check_exists "frontend/src/i18n/index.ts" "i18n config"
check_exists "frontend/src/i18n/locales/en.json" "English translations"
check_exists "frontend/src/i18n/locales/ar.json" "Arabic translations"
echo ""

echo "🐳 Checking Docker..."
check_exists "docker-compose.yml" "Docker compose"
check_exists "backend/Dockerfile" "Backend Dockerfile"
check_exists "frontend/Dockerfile" "Frontend Dockerfile"
echo ""

echo "📊 Checking Database..."
check_exists "database/schema.sql" "Database schema"
check_exists "database/seed.sql" "Seed data"
echo ""

echo "=========================================="
echo ""
echo -e "Results: ${GREEN}${PASSED} passed${NC}, ${RED}${FAILED} failed${NC}"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}✅ All checks passed! Project is healthy.${NC}"
    exit 0
else
    echo -e "${YELLOW}⚠️  Some checks failed. Please review.${NC}"
    exit 1
fi
