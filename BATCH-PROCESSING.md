# Batch Processing Guide

## Overview

The Legal Writing Assessment Tool now includes a powerful **Batch Processing Mode** that allows faculty to process multiple student submissions simultaneously and download all results as a single ZIP file.

## Key Features

### ✅ Supported File Formats
- **Text**: `.txt`
- **Markdown**: `.md`, `.markdown`
- **PDF**: `.pdf` (full text extraction)
- **Word**: `.docx` (full text extraction)

### ✅ Batch Capabilities
- Process unlimited files in one session
- Real-time progress tracking
- Individual file status indicators
- Automatic error handling
- Single ZIP download with all assessments

### ✅ Context Sharing
- Optional question (applied to all submissions)
- Optional model answer (applied to all submissions)
- Optional rubric (applied to all submissions)
- Reduces API calls by sharing context

## How to Use Batch Mode

### Step 1: Switch to Batch Mode
Click the **📚 Batch Processing** button at the top of the app.

### Step 2: Configure AI Settings (One Time)
1. Select your LLM provider (Anthropic, OpenAI, Google, or OpenRouter)
2. Enter your API key
3. Choose your model
4. API key is saved for future sessions

### Step 3: Add Context Files (Optional but Recommended)
Upload or paste:
- **Question**: The exam question all students are answering
- **Model Answer**: Your exemplary answer
- **Rubric**: Your grading criteria

**Why provide context?**
- Reduces API calls (saves money)
- More consistent grading
- Faster processing
- Better quality assessments

### Step 4: Upload Student Answer Files
**Option A: Drag & Drop**
- Drag multiple files directly onto the upload zone
- Files are added instantly

**Option B: Click to Browse**
- Click the upload zone
- Select multiple files (Ctrl+Click or Cmd+Click)
- Supports .txt, .md, .pdf, .docx

### Step 5: Review File List
Each file shows:
- 📄 File icon (based on type)
- File name
- File size
- Status: ⏳ Pending

Remove any files before processing by clicking "Remove"

### Step 6: Process All Files
Click **Process All Files** button

The tool will:
1. Parse each file (extract text from PDF/DOCX)
2. Generate missing context (if not provided)
3. Perform legal writing assessment
4. Update status for each file:
   - ⚙️ Processing
   - ✅ Complete
   - ❌ Error (with details)

Progress bar shows overall completion percentage.

### Step 7: Download Results
When complete, click **📥 Download Results (ZIP)**

You'll get a ZIP file named: `legal-assessments-YYYY-MM-DD.zip`

## ZIP File Contents

Each successful assessment produces a file named:
```
[StudentFileName]_assessment.txt
```

Each file contains:
```
LEGAL WRITING ASSESSMENT
========================

Student File: original_filename.pdf
Generated: 2024-10-24T14:30:00.000Z

QUESTION:
[The question text]

STUDENT ANSWER:
[Extracted student text]

MODEL ANSWER:
[Model answer text]

RUBRIC:
[Rubric text]

ASSESSMENT:
[Complete assessment with:
 - Framework detection
 - Component analysis  
 - Strengths
 - Areas for improvement
 - Socratic feedback questions
 - Scoring]
```

Failed files produce:
```
[StudentFileName]_ERROR.txt
```
With error details for troubleshooting.

## Best Practices

### 1. Provide Context Upfront
✅ **DO**: Upload question, model answer, and rubric before batch processing
❌ **DON'T**: Let the tool generate these for every file

**Savings**: If you have 30 files and don't provide context:
- Without context: 90 API calls (30 × 3 generation calls each)
- With context: 30 API calls (1 assessment call each)

### 2. Test with Sample First
✅ **DO**: Process 2-3 files first to verify setup
❌ **DON'T**: Upload 100 files without testing

### 3. Use Consistent File Naming
✅ **DO**: Name files descriptively
- `Smith_John_Essay1.pdf`
- `Jones_Sarah_FinalExam.docx`

❌ **DON'T**: Use generic names
- `answer1.pdf`
- `file.docx`

Assessment files will match your naming.

### 4. Choose the Right Model
**For large batches (50+ files):**
- Claude Haiku 4.5 (fast & cheap)
- Gemini 2.5 Flash (very affordable)
- GLM-4.5 via OpenRouter (free!)

**For important assessments:**
- Claude Sonnet 4.5 (best quality)
- GPT-5 (strong alternative)

### 5. Monitor Progress
Watch the real-time status indicators:
- ⏳ Pending → waiting
- ⚙️ Processing → currently working on this file
- ✅ Complete → assessment ready
- ❌ Error → check error message

### 6. Handle Errors Gracefully
If files fail:
1. Check error message in `[filename]_ERROR.txt`
2. Common issues:
   - Corrupted PDF/DOCX
   - Scanned PDF (no extractable text)
   - API rate limit hit
   - Invalid file format
3. Fix issues and reprocess failed files

## File Format Tips

### PDF Files
✅ **Good**: Text-based PDFs (created digitally)
❌ **Bad**: Scanned PDFs (images of text)

**Solution for scanned PDFs**: Use OCR software first, or have students submit DOCX

### Word Files
✅ **Good**: Standard .docx files
❌ **Bad**: Password-protected files

**Solution**: Have students remove password protection before submission

### Text/Markdown Files
✅ **Always work perfectly**
- Simplest format
- Fastest to process
- No compatibility issues

## Cost Examples

### Scenario 1: Small Class (20 Students)
**Without context:**
- Calls: 20 students × 4 calls = 80 calls
- Cost with Claude Haiku: ~$4-6

**With context:**
- Calls: 20 students × 1 call = 20 calls
- Cost with Claude Haiku: ~$1-1.50

**Savings: ~75%**

### Scenario 2: Large Class (100 Students)
**Without context:**
- Calls: 100 students × 4 calls = 400 calls
- Cost with Claude Haiku: ~$20-30

**With context:**
- Calls: 100 students × 1 call = 100 calls
- Cost with Claude Haiku: ~$5-8

**Savings: ~75%**

### Scenario 3: Free Tier (Testing)
**Using GLM-4.5 via OpenRouter:**
- Cost: $0 (completely free!)
- Quality: Good for draft feedback
- Speed: Comparable to paid options

## Workflow Examples

### Example 1: Final Exam Grading
```
1. Switch to Batch Mode
2. Upload: 
   - Question.pdf (the exam question)
   - ModelAnswer.pdf (your answer key)
   - Rubric.pdf (your grading rubric)
3. Upload all student PDFs (50 files)
4. Process
5. Download ZIP
6. Review assessments
7. Copy feedback into LMS
```

### Example 2: Practice Essay Feedback
```
1. Switch to Batch Mode
2. Paste question directly in text box
3. Leave model answer & rubric blank (will generate)
4. Upload student submissions (30 files)
5. Process (takes longer due to generation)
6. Download ZIP
7. Share feedback with students
```

### Example 3: Partial Context
```
1. Switch to Batch Mode
2. Upload only the question
3. Let tool generate model answer & rubric
   (same for all students, generated once then reused)
4. Upload student files
5. Process
6. Download ZIP
```

## Troubleshooting

### "Failed to parse PDF"
**Cause**: Scanned PDF or corrupted file
**Solution**: 
- Use OCR on scanned PDFs
- Re-export PDF from original source
- Convert to DOCX or TXT

### "API rate limit exceeded"
**Cause**: Too many requests too fast
**Solution**:
- Wait 60 seconds and restart
- Process in smaller batches (20-30 at a time)
- Switch to provider with higher limits

### "Out of API credits"
**Cause**: API account has insufficient funds
**Solution**:
- Add credits to your API account
- Switch to OpenRouter free tier (GLM-4.5)

### "Processing stuck at 47%"
**Cause**: Network issue or API timeout
**Solution**:
- Check browser console for errors
- Refresh page and restart batch
- Successfully processed files are saved

### Empty or garbled text from file
**Cause**: Unusual file encoding or format
**Solution**:
- Open file and re-save in standard format
- Convert to plain .txt file
- Check file isn't corrupted

## Performance Tips

### Speed Optimization
1. **Use faster models**:
   - GPT-5 Instant
   - Gemini 2.5 Flash
   - Claude Haiku 4.5

2. **Provide full context**:
   - Eliminates generation time per file

3. **Process during off-peak hours**:
   - API providers may be faster at certain times

### Quality Optimization
1. **Use premium models**:
   - Claude Sonnet 4.5
   - GPT-5
   - Gemini 2.5 Pro

2. **Provide detailed rubric**:
   - More specific rubric = more targeted feedback

3. **Include model answer**:
   - Enables better comparison and feedback

## Advanced Features

### Processing Multiple Classes
Process different classes separately:
1. Batch 1: Civil Procedure (with its question/rubric)
2. Reset and start new batch
3. Batch 2: Constitutional Law (with its question/rubric)

Each batch creates separate ZIP file.

### Reprocessing Failed Files
If some files failed:
1. Note which files have ❌ Error status
2. Download ZIP (contains errors as well)
3. Fix issues with those files
4. Create new batch with only failed files
5. Process and download

### Comparing Batches Over Time
Use consistent naming for tracking progress:
```
legal-assessments-2024-09-15-midterm.zip
legal-assessments-2024-10-15-midterm-retake.zip
legal-assessments-2024-12-10-final.zip
```

## Integration with LMS

### Canvas
1. Process batch
2. Download ZIP
3. Extract files
4. For each student:
   - Open their assessment file
   - Copy feedback
   - Paste into SpeedGrader

### Blackboard
Similar workflow - copy/paste feedback from assessment files

### Gradescope
1. Process batch
2. Download ZIP
3. Upload assessment files as rubric comments

### Google Classroom
1. Process batch
2. Download ZIP
3. Attach individual assessment files to student submissions

## Security & Privacy

- Files are processed client-side in your browser
- Content sent directly to your chosen AI provider
- No intermediate servers
- Files are never stored on our servers
- Download ZIP and delete from browser when done

## FAQ

**Q: Can I process files from different assignments together?**
A: Not recommended. Each batch should be for one assignment with consistent context.

**Q: What happens if I close the browser during processing?**
A: Processing will stop. You'll need to restart the batch.

**Q: Can I pause and resume?**
A: Not currently. Process in smaller batches if you need flexibility.

**Q: How long does it take?**
A: Depends on:
- Number of files: ~10-30 seconds per file
- Model speed: Faster models = faster processing
- API response time: Varies by provider

Example: 50 files with Claude Haiku = ~10-15 minutes

**Q: Can I process more than 100 files?**
A: Yes, but recommend processing in batches of 50-75 for better manageability.

**Q: Do I need to upload files in any order?**
A: No, order doesn't matter. All files processed equally.

**Q: Can I add more files after starting?**
A: No. Start a new batch for additional files.

---

**Ready to grade a whole class in minutes? Switch to Batch Mode and get started!**
