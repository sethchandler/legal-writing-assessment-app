#!/bin/bash

# Legal Writing Assessment Tool - Quick Deploy Script

echo "🚀 Legal Writing Assessment Tool - Quick Deploy"
echo "================================================"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install git first."
    exit 1
fi

# Check if gh (GitHub CLI) is installed
if ! command -v gh &> /dev/null; then
    echo "⚠️  GitHub CLI (gh) is not installed."
    echo "   You can install it from: https://cli.github.com/"
    echo "   Or continue with manual setup."
    echo ""
    read -p "Continue with manual setup? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
    MANUAL_SETUP=true
fi

# Get repository name
read -p "Enter repository name (default: legal-writing-assessment): " REPO_NAME
REPO_NAME=${REPO_NAME:-legal-writing-assessment}

echo ""
echo "📦 Setting up repository: $REPO_NAME"
echo ""

# Rename the HTML file to index.html
if [ -f "legal-writing-app.html" ]; then
    mv legal-writing-app.html index.html
    echo "✅ Renamed legal-writing-app.html to index.html"
fi

# Initialize git repository
if [ ! -d ".git" ]; then
    git init
    echo "✅ Initialized git repository"
fi

# Add all files
git add .
git commit -m "Initial commit: Legal Writing Assessment Tool"
echo "✅ Files committed"

if [ "$MANUAL_SETUP" = true ]; then
    echo ""
    echo "📋 Manual Setup Instructions:"
    echo ""
    echo "1. Create a new repository on GitHub: https://github.com/new"
    echo "   - Name it: $REPO_NAME"
    echo "   - Keep it public"
    echo "   - Don't initialize with README, .gitignore, or license"
    echo ""
    echo "2. Run these commands:"
    echo "   git remote add origin https://github.com/YOUR_USERNAME/$REPO_NAME.git"
    echo "   git branch -M main"
    echo "   git push -u origin main"
    echo ""
    echo "3. Enable GitHub Pages:"
    echo "   - Go to repository Settings"
    echo "   - Click 'Pages' in sidebar"
    echo "   - Under 'Source', select 'main' branch"
    echo "   - Click 'Save'"
    echo ""
    echo "4. Your app will be live at:"
    echo "   https://YOUR_USERNAME.github.io/$REPO_NAME/"
    echo ""
else
    # Create repository using GitHub CLI
    echo ""
    read -p "Create repository as public? (y/n) " -n 1 -r
    echo ""
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        gh repo create "$REPO_NAME" --public --source=. --remote=origin --push
    else
        gh repo create "$REPO_NAME" --private --source=. --remote=origin --push
    fi
    
    echo "✅ Repository created and pushed"
    
    # Enable GitHub Pages
    echo ""
    echo "🌐 Enabling GitHub Pages..."
    gh api repos/{owner}/{repo}/pages -X POST -f source[branch]=main -f source[path]=/
    
    echo ""
    echo "✅ Deployment complete!"
    echo ""
    echo "🎉 Your app will be live in 1-2 minutes at:"
    gh repo view --web
fi

echo ""
echo "📚 Next steps:"
echo "   - Read USAGE.md for user guide"
echo "   - Read DEPLOYMENT.md for deployment details"
echo "   - Get your API key from Anthropic or OpenAI"
echo ""
echo "✨ Happy grading!"
