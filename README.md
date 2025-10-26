# Legal Writing Assessment Tool

A powerful, privacy-focused web application for evaluating legal writing using IRAC (Issue, Rule, Application, Conclusion) and CREAC (Conclusion, Rule, Explanation, Application, Conclusion) frameworks.

![Legal Writing Assessment Tool](https://img.shields.io/badge/framework-IRAC%2FCREAC-blue) ![License](https://img.shields.io/badge/license-MIT-green) ![Deploy](https://img.shields.io/badge/deploy-GitHub%20Pages-orange)

## 🎯 Features

### Intelligent Assessment Generation
- **Auto-generates missing components**: Question, Model Answer, or Rubric
- **Sequential generation**: Maintains proper dependencies
- **AI-powered evaluation**: Comprehensive legal writing analysis

### Comprehensive Feedback
- ✅ Framework detection (IRAC vs CREAC)
- ✅ Component-by-component analysis
- ✅ Conclusory statement identification
- ✅ Fact-to-rule connection evaluation
- ✅ Analogical reasoning assessment
- ✅ Counterargument analysis
- ✅ Socratic questioning for improvement

### Advanced Features
- 🚀 **Prompt Caching**: Reduce API costs by 50-90% (Anthropic, OpenAI, Google Gemini)
- 📦 **Batch Processing**: Assess multiple student answers in one operation with progress tracking
- 📋 **Output Controls**: Select what to include in downloads (Question, Student Answer, Model Answer, Rubric, Assessment)
- 🎨 **Improved Mode Switcher**: Clear text labels always visible (not just icons)
- ⚠️ **User-Friendly Error Messages**: See errors in the UI without opening DevTools
- ⚙️ **Advanced Diagnostics**: Optional custom model for error explanation

### Privacy & Security
- 🔒 No server-side processing
- 🔒 API keys stored locally in browser
- 🔒 Direct API calls to providers
- 🔒 Zero data collection

## 🚀 Quick Start

### Option 1: Use Online (Recommended)

Visit the live demo: `https://[your-username].github.io/legal-writing-assessment/`

### Option 2: Deploy Your Own

1. **Fork this repository**
2. **Enable GitHub Pages**:
   - Go to Settings → Pages
   - Source: main branch
   - Save
3. **Access your deployment**: `https://[your-username].github.io/[repo-name]/`

### Option 3: Run Locally

```bash
# Clone the repository
git clone https://github.com/[username]/legal-writing-assessment.git

# Open in browser
open index.html

# Or use a local server
python -m http.server 8000
```

## 📋 Prerequisites

- Modern web browser (Chrome, Firefox, Safari, Edge)
- API key from Anthropic or OpenAI

### Getting API Keys

**Anthropic**:
1. Visit https://console.anthropic.com/
2. Sign up / Log in
3. Navigate to API Keys
4. Create new key

**OpenAI**:
1. Visit https://platform.openai.com/
2. Sign up / Log in
3. Navigate to API Keys
4. Create new key

**Google AI**:
1. Visit https://aistudio.google.com/
2. Sign up / Log in
3. Get API Key

**OpenRouter** (Access to multiple models):
1. Visit https://openrouter.ai/
2. Sign up / Log in
3. Navigate to Keys
4. Create new key

## 📖 How It Works

### Step 1: Input Data
Provide at minimum a **Student Answer**. Optionally include:
- Question (exam prompt)
- Model Answer (exemplary response)
- Rubric (grading criteria)

### Step 2: Generate JSON
The tool creates a complete assessment structure, auto-generating any missing fields using AI in the proper order:
1. Question (if missing)
2. Model Answer (if missing)
3. Rubric (if missing)

### Step 3: Assessment
Receive comprehensive feedback including:
- Framework detection
- Overall score with breakdown
- Component analysis
- Identified strengths
- Areas for improvement
- Socratic questions for revision

## 🎓 Use Cases

### For Law Faculty
- Grade exam answers efficiently
- Provide structured, consistent feedback
- Generate rubrics automatically
- Create model answers for future use
- Maintain assessment records (JSON export)

### For Law Students
- Self-assess practice answers
- Get immediate feedback
- Improve legal reasoning skills
- Prepare for exams
- Learn IRAC/CREAC frameworks

### For Bar Prep
- Practice bar exam essays
- Compare to model answers
- Identify weak areas
- Improve systematically

## 🏗️ Architecture

### Technology Stack
- **Frontend**: React 18 (via CDN)
- **Styling**: Custom CSS with gradient design
- **AI Integration**: Direct API calls (BYOK)
- **Deployment**: Static HTML (GitHub Pages)
- **Storage**: Browser localStorage

### Why This Architecture?
- ✅ **Zero maintenance**: No server to manage
- ✅ **Zero cost hosting**: GitHub Pages is free
- ✅ **Privacy**: No backend, no data collection
- ✅ **Simplicity**: Single HTML file
- ✅ **Reliability**: No dependencies to break

## 📊 API Costs

Typical costs per assessment:

| Provider | Model | Cost per Assessment |
|----------|-------|---------------------|
| Anthropic | Claude Sonnet 4.5 | $0.05 - $0.15 |
| Anthropic | Claude Haiku 4.5 | $0.02 - $0.08 |
| OpenAI | GPT-5 | $0.20 - $0.50 |
| OpenAI | GPT-5 Mini | $0.05 - $0.15 |
| OpenAI | GPT-4.1 | $0.15 - $0.40 |
| Google | Gemini 2.5 Pro | $0.10 - $0.30 |
| Google | Gemini 2.5 Flash | $0.02 - $0.08 |
| OpenRouter | GLM-4.5 (Free) | $0.00 |

*Costs vary based on answer length and completeness of inputs. OpenRouter pricing may differ.*

## 🔧 Configuration

### Supported Models

**Anthropic:**
- Claude Sonnet 4.5 (recommended for best results)
- Claude Haiku 4.5 (recommended for cost efficiency)

**OpenAI:**
- GPT-5
- GPT-5 Mini
- GPT-5 Nano

**Google:**
- Gemini 2.5 Pro
- Gemini 2.5 Flash (recommended, implicit caching)
- Gemini 2.5 Flash Lite

**OpenRouter:**
- Access to all above models plus:
- GLM-4.5 (Free tier available via OpenRouter)

### Customization

Edit `index.html` to customize:
- Color scheme (CSS variables)
- Default model selection
- UI text and labels
- Assessment prompts

## 📚 Documentation

- **[DEPLOYMENT.md](DEPLOYMENT.md)**: Detailed deployment instructions
- **[USAGE.md](USAGE.md)**: Comprehensive user guide
- **Legal Writing Skill**: Based on professional legal writing assessment framework

## 🤝 Contributing

Contributions welcome! Areas for improvement:
- Additional framework support
- Export formats (PDF, DOCX)
- Batch processing UI
- More AI providers
- Accessibility enhancements

## 🐛 Troubleshooting

### Common Issues

**API Key Errors**:
- Verify key is correct
- Check API credits
- Try regenerating key

**Slow Performance**:
- Large answers take longer
- Network speed affects API calls
- Try with shorter test answer

**Missing Assessment**:
- Ensure all required fields provided
- Check browser console for errors
- Verify API provider status

See [USAGE.md](USAGE.md#troubleshooting) for more help.

## 📄 License

MIT License - See LICENSE file for details

## 🙏 Acknowledgments

- Based on legal writing assessment frameworks used in top law schools
- Designed for law faculty and students
- Built with privacy and simplicity in mind

## 📧 Support

- 📖 Read the [Usage Guide](USAGE.md)
- 🐛 Report issues via GitHub Issues
- 💡 Suggest features via GitHub Discussions

## 🗺️ Roadmap

- [x] Batch processing interface (✅ Complete)
- [x] Prompt caching to reduce API costs (✅ Complete)
- [x] User-friendly error messages (✅ Complete)
- [ ] PDF export of assessments
- [ ] Historical comparison charts
- [ ] Additional frameworks (FIRAC, etc.)
- [ ] Mobile app version
- [ ] Offline mode with local models
- [ ] Email notifications for batch completion

## ⭐ Star History

If you find this tool useful, please star the repository!

---

**Built with** ❤️ **for legal education**

Made possible by: Anthropic Claude API | OpenAI API | GitHub Pages
