# Legal Writing Assessment Tool - Deployment Guide

## Overview

This application is a single-file React app that can be deployed to GitHub Pages with zero configuration. It evaluates legal writing using IRAC/CREAC frameworks.

## Quick Deployment to GitHub Pages

### Method 1: Via GitHub Web Interface (Easiest)

1. **Create a new GitHub repository**
   - Go to https://github.com/new
   - Name it (e.g., `legal-writing-assessment`)
   - Set to Public
   - Click "Create repository"

2. **Upload the file**
   - Click "uploading an existing file"
   - Drag and drop `legal-writing-app.html`
   - Rename it to `index.html` (important!)
   - Commit the file

3. **Enable GitHub Pages**
   - Go to repository Settings
   - Click "Pages" in the left sidebar
   - Under "Source", select "main" branch
   - Click "Save"

4. **Access your app**
   - Wait 1-2 minutes
   - Your app will be live at: `https://[username].github.io/[repo-name]/`

### Method 2: Via Git Command Line

```bash
# Create a new directory
mkdir legal-writing-assessment
cd legal-writing-assessment

# Initialize git repository
git init

# Copy the HTML file and rename it
cp /path/to/legal-writing-app.html index.html

# Add and commit
git add index.html
git commit -m "Initial commit: Legal Writing Assessment Tool"

# Create GitHub repository (via GitHub CLI or web)
# Then add remote and push
git remote add origin https://github.com/[username]/[repo-name].git
git branch -M main
git push -u origin main

# Enable GitHub Pages via Settings > Pages > Source: main branch
```

## Custom Domain (Optional)

To use a custom domain:

1. Add a `CNAME` file to your repository with your domain name
2. Configure DNS settings with your domain provider
3. Wait for DNS propagation (up to 24 hours)

## Alternative Hosting Options

### Netlify Drop

1. Go to https://app.netlify.com/drop
2. Rename `legal-writing-app.html` to `index.html`
3. Drag and drop the file
4. Get instant deployment URL

### Vercel

1. Install Vercel CLI: `npm i -g vercel`
2. Rename file to `index.html`
3. Run: `vercel`
4. Follow prompts

### CloudFlare Pages

1. Go to CloudFlare Pages dashboard
2. Connect your GitHub repository
3. Deploy with zero configuration

### Local Testing

Simply open `legal-writing-app.html` in any modern web browser. No server required!

```bash
# Or use a simple HTTP server
python -m http.server 8000
# Then visit http://localhost:8000/legal-writing-app.html
```

## Requirements

- **Browser**: Modern browser with JavaScript enabled
- **API Key**: Anthropic or OpenAI API key (user provides)
- **No backend needed**: Everything runs client-side

## Security Notes

- API keys are stored in browser's localStorage
- Keys never leave the user's browser
- Direct API calls from browser to AI providers
- No server-side processing or storage

## Cost Considerations

- **Hosting**: Free (GitHub Pages, Netlify, etc.)
- **API costs**: User pays for their own API usage
- **Maintenance**: Zero ongoing costs

## Updating the App

To update the deployed app:

1. Modify the `index.html` file locally
2. Commit and push changes to GitHub
3. GitHub Pages automatically rebuilds (1-2 minutes)

## Troubleshooting

### App not loading
- Check that file is named `index.html`
- Verify GitHub Pages is enabled in repository settings
- Wait 2-3 minutes after pushing changes

### API errors
- Verify API key is correct
- Check API provider status page
- Ensure sufficient API credits

### CORS errors
- This shouldn't happen with direct API calls
- If it does, check browser console for details

## Browser Compatibility

Works on:
- Chrome/Edge 90+
- Firefox 88+
- Safari 14+
- Mobile browsers (iOS Safari, Chrome Mobile)

## File Structure

```
your-repo/
└── index.html          # The entire application (single file)
```

That's it! No build process, no dependencies, no configuration.

## Advanced: Adding Google Analytics (Optional)

Add before `</head>`:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

## Support

For issues:
1. Check browser console for errors
2. Verify API key and credits
3. Test with latest browser version
4. Open GitHub issue with details

## License

This application uses the legal writing assessment skill which is designed for educational purposes in law schools.
