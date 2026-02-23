#!/bin/bash

echo "🧪 Testing Al Khayma Resort API..."
echo ""

BASE_URL="http://localhost:8000"

# Test 1: Health Check
echo "1️⃣ Testing Health Check..."
curl -s "$BASE_URL/health" | python3 -m json.tool
echo ""

# Test 2: Root Endpoint
echo "2️⃣ Testing Root Endpoint..."
curl -s "$BASE_URL/" | python3 -m json.tool
echo ""

# Test 3: Get Rooms
echo "3️⃣ Testing Get Rooms..."
curl -s "$BASE_URL/api/rooms" | python3 -m json.tool | head -20
echo ""

# Test 4: Get Products
echo "4️⃣ Testing Get Products..."
curl -s "$BASE_URL/api/products" | python3 -m json.tool | head -20
echo ""

# Test 5: Register User
echo "5️⃣ Testing User Registration..."
curl -s -X POST "$BASE_URL/api/auth/register" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "test123",
    "full_name": "Test User",
    "phone": "+966501234567"
  }' | python3 -m json.tool
echo ""

# Test 6: Login
echo "6️⃣ Testing User Login..."
TOKEN=$(curl -s -X POST "$BASE_URL/api/auth/login" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "username=admin@alkhayma.com&password=admin123" | python3 -c "import sys, json; print(json.load(sys.stdin)['access_token'])")

if [ ! -z "$TOKEN" ]; then
  echo "✅ Login successful! Token: ${TOKEN:0:20}..."
else
  echo "❌ Login failed"
fi
echo ""

echo "✅ API Tests Complete!"
echo ""
echo "📚 Full API Documentation: $BASE_URL/docs"
