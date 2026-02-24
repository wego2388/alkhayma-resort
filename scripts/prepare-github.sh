#!/bin/bash

echo "📦 Preparing project for GitHub..."
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "❌ Git not initialized. Run: git init"
    exit 1
fi

echo "✅ Git repository ready"
echo ""

# Show repository status
echo "📊 Repository Status:"
git log --oneline -1
echo ""
git status --short | head -10
echo ""

# Instructions
echo "🚀 Next Steps to Push to GitHub:"
echo ""
echo "1. Create a new repository on GitHub:"
echo "   https://github.com/new"
echo ""
echo "2. Run these commands:"
echo ""
echo "   git remote add origin https://github.com/YOUR_USERNAME/alkhayma-resort.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. Or if you already have a repository:"
echo ""
echo "   git remote add origin YOUR_REPO_URL"
echo "   git push -u origin master"
echo ""
echo "📝 Repository Info:"
echo "   Total commits: $(git rev-list --count HEAD)"
echo "   Files tracked: $(git ls-files | wc -l)"
echo "   Branch: $(git branch --show-current)"
echo ""
