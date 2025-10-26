# Legal Writing Assessment Tool - Usage Guide

## Overview

This tool helps law faculty and students evaluate legal writing using the IRAC (Issue, Rule, Application, Conclusion) or CREAC (Conclusion, Rule, Explanation, Application, Conclusion) frameworks.

## Key Features

### 1. Intelligent JSON Generation
- Automatically generates missing assessment components
- Sequential generation: Question → Model Answer → Rubric
- Maintains proper order and dependencies

### 2. AI-Powered Assessment
- Evaluates legal reasoning and structure
- Identifies conclusory statements
- Checks fact-to-rule connections
- Analyzes analogical reasoning
- Provides Socratic feedback questions

### 3. Privacy-Focused
- Your API key never leaves your browser
- Direct API calls (no intermediary servers)
- Local storage only

## Getting Started

### Step 1: Configure AI Provider

1. **Choose Your Provider**
   - Anthropic (Claude) - Recommended for legal analysis
   - OpenAI (GPT-5)
   - Google (Gemini)
   - OpenRouter (Access to multiple models, including free options)

2. **Enter API Key**
   - Get Anthropic API key: https://console.anthropic.com/
   - Get OpenAI API key: https://platform.openai.com/
   - Get Google API key: https://aistudio.google.com/
   - Get OpenRouter API key: https://openrouter.ai/
   - Key is saved in browser for future use

3. **Select Model**
   - **Anthropic**: Claude Sonnet 4.5 (recommended), Claude Haiku 4.5 (cost-efficient)
   - **OpenAI**: GPT-5, GPT-5 Mini, GPT-5 Nano
   - **Google**: Gemini 2.5 Pro, Gemini 2.5 Flash (with implicit caching), Gemini 2.5 Flash Lite
   - **OpenRouter**: All above models + GLM-4.5 (Free tier available)

### Step 2: Input Assessment Data

You can provide all or some of the following:

#### Required:
- **Student Answer**: The legal writing to be evaluated

#### Optional (will be auto-generated if missing):
- **Question**: The exam question or legal prompt
- **Model Answer**: An exemplary response
- **Rubric**: Grading criteria and scoring guide

**Tip**: You can paste text directly or upload `.txt` or `.md` files for each field.

### Step 3: Generate JSON Structure

Click "Generate Assessment Data" to:
1. Fill in any missing fields using AI
2. Create a complete JSON structure
3. Preview the generated data

**Generation Order**: If fields are missing, they're generated sequentially:
1. Question (requires student answer)
2. Model Answer (requires question + student answer)
3. Rubric (requires question)

### Step 4: Perform Assessment

The tool will:
- Detect framework (IRAC vs CREAC)
- Analyze each component
- Identify common errors
- Provide detailed feedback
- Suggest improvements via Socratic questions

## Assessment Output

The assessment includes:

### 1. Framework Detection
- Identifies whether student used IRAC or CREAC
- Notes if wrong framework was used

### 2. Overall Score
- Breakdown by rubric categories
- Total score with justification

### 3. Component Analysis

**For IRAC:**
- Issue: Clarity and neutrality
- Rule: Completeness, structure, organization
- Application: Fact-to-rule connections, reasoning
- Conclusion: Appropriateness and completeness

**For CREAC:**
- Conclusion: Assertiveness and support
- Rule: Same as IRAC
- Explanation: Case illustrations and organization
- Application: Same as IRAC + analogical reasoning
- Conclusion: Same as IRAC

### 4. Strengths
- 2-3 specific examples of good legal writing
- Concrete citations from student answer

### 5. Areas for Improvement

**Conclusory Statements**: Most critical issue
- Examples from student's answer
- Guiding questions to strengthen

**Fact-to-Rule Connections**:
- Where connections are weak
- How to improve linking

**Analogical Reasoning**:
- Evaluation of case comparisons
- Suggestions for deeper analysis

**Counterarguments**:
- Missing opposing views
- Questions to prompt consideration

**Structural Issues**:
- Component bleeding
- Bundling problems
- Organization concerns

### 6. Specific Feedback Questions
- Socratic prompts for student reflection
- No direct answers provided
- Guides students to discover solutions

## Advanced Features (Version 3.0)

### Prompt Caching (Save API Costs)

**What is it?** When processing multiple assessments with the same question, rubric, and model answer, caching prevents resending that static content.

**Cost Savings:**
- Anthropic: Up to 90% reduction on cached prompts
- OpenAI: Up to 50% reduction on cached prompts
- Google Gemini 2.5: Implicit caching (automatic)

**How to use:**
1. In "AI Configuration", look for "Enable Prompt Caching"
2. Checkbox appears only for models that support it
3. Toggle on/off as needed
4. Status indicator shows caching status

**Best for:** Batch processing many students with the same exam question

### Batch Processing with Error Reporting

**What it does:**
- Upload multiple student answer files (PDF, DOCX, TXT)
- Process all at once with progress tracking
- See real-time: "3 of 25 completed" + current file + elapsed time

**Output Controls:**
- Checkboxes let you choose what to include in downloads:
  - Question, Student Answer, Model Answer, Rubric, Assessment
- Download as ZIP of text files OR JSON files
- Each file preserves student's original filename

**Error Handling:**
- Friendly error messages shown in UI (no DevTools needed)
- "Show technical details" button for debugging
- "Copy" button to share error information

### Output Controls

Located above "Generate Assessment Data" button:
- ☐ Question
- ☐ Student Answer
- ☐ Model Answer
- ☐ Rubric
- ☐ Assessment

Selections apply to all downloads and are remembered for future batches.

### Advanced Diagnostics (Optional)

If error messages are still unclear:
1. Click "Advanced Diagnostics" (collapsed by default)
2. Check "Use custom model for error diagnosis"
3. Select which model to use for explaining errors
4. That model will be called when dictionary lookups fail

**Note**: This is optional and advanced. Most users won't need it.

## Common Use Cases

### Faculty Grading
1. Upload student answer
2. Provide question and rubric (or let AI generate)
3. Review comprehensive assessment
4. Use feedback questions in your comments
5. Download JSON for record-keeping

### Student Self-Assessment
1. Paste your answer
2. Provide the question you're answering
3. Get immediate feedback
4. Work through Socratic questions
5. Revise and resubmit

### Practice Exam Creation
1. Provide student answer from past exam
2. Generate model answer automatically
3. Generate rubric automatically
4. Use for teaching or practice materials

## Tips for Best Results

### For Faculty

1. **Provide Context**: Include the full question for accurate assessment
2. **Custom Rubrics**: Upload your specific rubric for consistent grading
3. **Model Answers**: Provide your own model answer for comparison
4. **Batch Processing**: Save JSON files for each assessment as records

### For Students

1. **Complete Answers**: Submit full answers, not drafts
2. **Framework Awareness**: Know whether you're using IRAC or CREAC
3. **Iterate**: Use feedback to revise, then reassess
4. **Focus on Application**: This section typically needs the most work
5. **Answer Questions**: Work through the Socratic prompts seriously

## Understanding Common Errors

### Conclusory Statements
❌ **Bad**: "The defendant was negligent."
✅ **Good**: "The defendant was negligent because he failed to check his blind spot before changing lanes, breaching the duty of reasonable care that requires drivers to be aware of their surroundings."

**Key**: Connect facts to legal elements using "because"

### Weak Fact-to-Rule Connection
❌ **Bad**: "The contract is valid. The parties agreed."
✅ **Good**: "The contract is valid because both parties exchanged mutual promises—Seller promised to deliver goods, and Buyer promised to pay—satisfying the consideration requirement."

**Key**: Explicitly show how facts satisfy legal elements

### Missing Counterarguments
❌ **Bad**: Only presents one side
✅ **Good**: Presents strongest opposing view, then rebuts it with analysis

**Key**: Acknowledge and address the best opposing argument

### Component Bleeding
❌ **Bad**: Current case facts in Rule section
✅ **Good**: Rule section contains only abstract law; Application contains current facts

**Key**: Keep components pure—law in Rule, facts in Application

## Data Privacy

- All processing happens in your browser
- API keys stored locally (localStorage)
- No data sent to our servers
- Direct API calls to your chosen provider
- You control and own all data

## Cost Management

### API Usage
- Typical assessment: 2-4 API calls
- Generation + Assessment
- Claude Sonnet 4.5: ~$0.05-0.15 per assessment
- Claude Haiku 4.5: ~$0.02-0.08 per assessment
- GPT-5: ~$0.20-0.50 per assessment
- GPT-5 Mini: ~$0.05-0.15 per assessment
- Gemini 2.5 Flash: ~$0.02-0.08 per assessment
- GLM-4.5 (OpenRouter): Free!

### Optimization Tips
- Provide question/rubric to reduce calls
- Use cheaper models for practice (Haiku, Flash, GLM-4.5)
- Use OpenRouter's free tier (GLM-4.5) for testing
- Batch assessments when possible

## Keyboard Shortcuts

- `Tab` / `Shift+Tab`: Navigate between fields
- `Ctrl+V` / `Cmd+V`: Paste text
- `Ctrl+Enter` / `Cmd+Enter`: Submit current step

## Exporting Results

### JSON Export
- Click "Download JSON" to save assessment data
- Includes all inputs and metadata
- Can be reloaded for reference

### Copy Assessment
- Highlight and copy assessment text
- Paste into gradebook or LMS
- Format preserved

## Troubleshooting

### "API request failed"
- Check API key is correct
- Verify API credits available
- Check provider status page

### "Missing required fields"
- Ensure student answer is provided
- API key must be set

### Assessment seems inaccurate
- Verify question matches answer
- Check that full answer was provided
- Try with model answer included

### Slow performance
- Large answers take longer to process
- Network speed affects API calls
- Try shorter test answer first

## Best Practices

### For Accurate Assessments

1. **Complete Context**: Provide full question and complete student answer
2. **Appropriate Model**: Use Claude Sonnet 4 for legal analysis
3. **Clear Rubric**: Specific rubrics give more targeted feedback
4. **Full Answer**: Don't truncate student responses

### For Cost Efficiency

1. **Provide More Fields**: Reduce AI generation needs
2. **Test Small**: Try with short answers first
3. **Reuse Rubrics**: Same rubric for similar questions
4. **Batch Work**: Do multiple assessments in one session

### For Student Learning

1. **Work Through Questions**: Don't skip Socratic prompts
2. **Revise and Reassess**: Use tool iteratively
3. **Focus on Patterns**: Look for repeated issues
4. **Study Examples**: Compare with model answer

## Framework Reference

### IRAC (Exams)
1. **Issue**: Neutral question
2. **Rule**: Complete statement of law
3. **Application**: Facts applied to law
4. **Conclusion**: Answer to issue

### CREAC (Memos/Briefs)
1. **Conclusion**: Assertive answer with "because"
2. **Rule**: Complete statement of law
3. **Explanation**: Case illustrations
4. **Application**: Facts applied via analogical reasoning
5. **Conclusion**: Restatement

## Getting Help

- Check browser console for error messages
- Verify API key has sufficient credits
- Review this guide's troubleshooting section
- Ensure using modern browser (Chrome, Firefox, Safari)

## Advanced Features

### Batch Processing
Process multiple answers by:
1. Assess first answer
2. Download JSON
3. Reset form
4. Repeat with next answer
5. Compare JSON files

### Custom Prompting
Modify assessment criteria by:
1. Providing detailed custom rubric
2. Including specific evaluation focus in question
3. Referencing specific legal doctrines

### Record Keeping
Maintain assessment records:
1. Download JSON after each assessment
2. Save assessment text to files
3. Create assessment database
4. Track student progress over time

## Version Information

- **Generated from**: legal-writing-assessment.skill
- **Architecture**: Single-page React application
- **Deployment**: GitHub Pages compatible
- **Last Updated**: 2024

---

For technical deployment questions, see `DEPLOYMENT.md`
