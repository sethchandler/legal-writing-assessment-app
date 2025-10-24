# Quick Reference Guide

## 🚀 5-Minute Setup

### Deploy to GitHub Pages

1. **Upload to GitHub**
   ```bash
   # Option 1: Web Interface
   - Create new repo at github.com/new
   - Upload all files (drag & drop)
   - Go to Settings > Pages > Source: main branch
   
   # Option 2: Command Line
   ./deploy.sh
   ```

2. **Get API Key**
   - Anthropic: https://console.anthropic.com/
   - OpenAI: https://platform.openai.com/
   - Google: https://aistudio.google.com/
   - OpenRouter: https://openrouter.ai/ (has free tier!)

3. **Access Your App**
   - `https://[username].github.io/[repo-name]/`

## 📝 Quick Usage

### Minimal Input (Auto-generate everything)
1. Paste student answer
2. Enter API key
3. Click "Generate Assessment Data"
4. Click "Perform Assessment"

### Full Control
1. Provide question, student answer, model answer, rubric
2. Enter API key
3. Click "Generate Assessment Data"
4. Click "Perform Assessment"

## 🎯 Key Features at a Glance

| Feature | Description |
|---------|-------------|
| **Auto-Generation** | Creates missing Question/Model Answer/Rubric |
| **Framework Detection** | Identifies IRAC vs CREAC |
| **Error Analysis** | Finds conclusory statements, weak connections |
| **Socratic Feedback** | Provides guiding questions, not answers |
| **JSON Export** | Save assessment data for records |
| **Privacy-First** | No server, API key stays in browser |

## 💰 Cost Guide

**Per Assessment**: $0.00 - $0.50 depending on:
- Model choice (GLM-4.5 free, Haiku/Flash cheapest paid)
- Answer length
- Whether fields need generation

**Optimization**:
- Provide question/rubric = fewer AI calls
- Use Claude Haiku 4.5 or Gemini Flash = low cost
- Use OpenRouter GLM-4.5 = completely free!
- Shorter answers = faster & cheaper

## 🐛 Common Issues

| Problem | Solution |
|---------|----------|
| "API request failed" | Check API key & credits |
| Assessment too generic | Provide more context (question + rubric) |
| Slow performance | Try shorter answer first |
| Changes not showing | Hard refresh (Ctrl+F5) |

## 📚 File Structure

```
your-repo/
├── index.html           # The app (single file!)
├── README.md            # Overview
├── DEPLOYMENT.md        # Detailed deploy guide
├── USAGE.md             # Complete user manual
├── LICENSE              # MIT License
├── deploy.sh           # Quick deploy script
├── .gitignore          # Git ignore rules
└── .github/
    └── workflows/
        └── deploy.yml  # Auto-deploy config
```

## 🔑 Keyboard Shortcuts

- `Tab` / `Shift+Tab` - Navigate fields
- `Ctrl+V` / `Cmd+V` - Paste text
- `Ctrl+Enter` - Submit step

## 📊 Assessment Components

### IRAC Format
1. **Issue** - Neutral legal question
2. **Rule** - Statement of law
3. **Application** - Facts → Law analysis
4. **Conclusion** - Answer to issue

### CREAC Format
1. **Conclusion** - Assertive answer
2. **Rule** - Statement of law
3. **Explanation** - Case illustrations
4. **Application** - Analogical reasoning
5. **Conclusion** - Restatement

## ⚡ Pro Tips

### For Faculty
- ✅ Batch process: Keep API key saved
- ✅ Export JSON: Track assessments over time
- ✅ Custom rubrics: Use your own criteria
- ✅ Model answers: Generate once, reuse

### For Students
- ✅ Iterate: Revise based on feedback
- ✅ Answer questions: Work through Socratic prompts
- ✅ Compare: Study model answer differences
- ✅ Focus on Application: Most points here

## 🔗 Quick Links

- **Get Anthropic API Key**: https://console.anthropic.com/
- **Get OpenAI API Key**: https://platform.openai.com/
- **Get Google API Key**: https://aistudio.google.com/
- **Get OpenRouter API Key**: https://openrouter.ai/ (Free tier available!)
- **GitHub Pages Docs**: https://pages.github.com/
- **Report Issues**: [GitHub Issues]

## 📞 Support Checklist

Before asking for help:
- [ ] Checked browser console for errors
- [ ] Verified API key is correct
- [ ] Confirmed API has credits
- [ ] Tested with shorter answer
- [ ] Read USAGE.md troubleshooting section

## 🎓 What Makes Good Legal Writing?

**Strong Application Section Has:**
- ✅ Explicit fact-to-rule connections
- ✅ "Because" clauses linking facts to elements
- ✅ Counterarguments addressed
- ✅ Analogical reasoning (for CREAC)
- ✅ No conclusory statements

**Weak Application Section Has:**
- ❌ Naked legal conclusions
- ❌ Missing fact connections
- ❌ One-sided analysis
- ❌ Generic statements

## 📈 Version Info

- **Architecture**: Single-page React app
- **Deployment**: GitHub Pages (free)
- **Cost**: $0 hosting + API usage
- **Maintenance**: Zero (static site)
- **Updates**: Git push (auto-deploys)

---

**Need More Detail?**
- Full deployment guide: See [DEPLOYMENT.md](DEPLOYMENT.md)
- Complete usage guide: See [USAGE.md](USAGE.md)
- Technical details: See [README.md](README.md)
