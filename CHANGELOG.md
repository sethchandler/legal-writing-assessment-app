# Changelog

## 🆕 Version 3.0 - Error Handling & Advanced Features (October 26, 2024)

### ✅ 1. User-Friendly Error Messages
**Problem**: Errors only visible in browser DevTools; non-technical users (professors, students) couldn't understand failures
**Solution**:
- **Error Mapping Dictionary**: 40+ common error patterns mapped to plain English explanations
- **LLM Error Translation**: Unknown errors sent to LLM for intelligent explanation
- **Hybrid Approach**: Fast dictionary lookup first, intelligent LLM fallback second
- **In-UI Display**: Error messages shown directly in batch results without DevTools access
- **Expandable Details**: Technical details hidden by default, available for debugging
- **Copy Button**: Easy sharing of error information for support

### ✅ 2. Prompt Caching to Reduce API Costs
**Problem**: Same question, rubric, model answer sent repeatedly to LLM, wasting money
**Solution**:
- **Anthropic Caching**: 90% cost reduction on cached prompts (uses cache_control headers)
- **OpenAI Caching**: 50% cost reduction on cached prompts (uses cache_control headers)
- **Google Gemini 2.5**: Implicit caching (automatic, no code changes needed)
- **OpenRouter Support**: Automatic detection and caching based on underlying model
- **User Control**: Toggle in UI to enable/disable caching
- **Status Indicator**: Shows caching status for each model

### ✅ 3. Advanced Diagnostics for Error Translation
**Problem**: Some error messages still unclear even when translated
**Solution**:
- **Optional Custom Model**: Advanced section lets users select different model for error explanation
- **Hidden by Default**: Only visible in advanced settings (doesn't confuse typical users)
- **Provider-Aware**: Offers appropriate models based on selected provider
- **Help Text**: Clear explanation of what this feature does

### ✅ 4. Output Controls for Batch Processing
**Problem**: Users had to download everything or nothing
**Solution**:
- **Granular Control**: Checkboxes for each component (Question, Student Answer, Model Answer, Rubric, Assessment)
- **Persistent Settings**: Choices remembered across batches
- **Default All**: Starts with all selected for backward compatibility
- **UI Position**: Placed above "Generate Assessment" button for easy access

### ✅ 5. Improved Mode Switcher
**Problem**: Icon-only toggle was confusing (📝 vs 📚)
**Solution**:
- **Text Labels Always Visible**: "Single Assessment" and "Batch Processing" text always shown
- **Better Visual Feedback**: Active state clearly highlighted
- **Improved Accessibility**: Text labels help screen readers

### Model Cleanup
- Removed outdated OpenAI models: gpt-5-chat, gpt-5-thinking, gpt-5-instant, gpt-4.1
- Fixed OpenRouter model naming: anthropic/claude-sonnet-4.5, anthropic/claude-haiku-4.5
- Verified all models against current provider documentation

## 🎉 Version 2.0 - Major Enhancements Based on User Feedback (October 24, 2024)

## Previous Features

### ✅ 1. Real-Time Status Feedback
**Problem**: Users couldn't see what was happening during processing
**Solution**: 
- Status messages for every step ("Generating question...", "Creating JSON...", "Analyzing...")
- Real-time timer showing elapsed time (⏱ 15s, ⏱ 1m 23s)
- Clear progress indicators throughout

### ✅ 2. JSON Mode for Two-Stage Processing
**Problem**: Couldn't use different models for JSON generation vs. assessment
**Solution**:
- **Form Input** mode (original): Generate JSON from scratch
- **JSON Input** mode (new): Upload or paste pre-generated JSON
- Allows workflow: Use cheap model for JSON → Use premium model for assessment
- Upload .json files or paste directly

### ✅ 3. Enhanced Download Options - Single Mode
**Problem**: No way to save intermediate or final results
**Solution**:
- **Step 2 (JSON Ready)**: Download assessment data as JSON
- **Step 3 (Complete)**: 
  - Download assessment as TXT (for student feedback)
  - Download complete JSON (includes question, answers, rubric, AND assessment)

### ✅ 4. Enhanced Download Options - Batch Mode
**Problem**: Only one output format, no progress details
**Solution**:
- **Text Format**: Individual TXT files for each student (original)
- **JSON Format**: Individual JSON files with complete data structure
- Each file named after student's original filename
- Errors saved separately for easy identification

### ✅ 5. Improved Batch Progress Tracking
**Problem**: "Processing..." was vague
**Solution**:
- **File Counter**: "3 of 15 completed"
- **Current File**: Shows which file is being processed
- **Timer**: Elapsed time display
- **Status Updates**: What's happening right now
- **Completion Summary**: X successful, Y errors

### ✅ 6. Button Improvements
**Problem**: Buttons didn't show count or what would happen
**Solution**:
- Batch button shows: "Process All Files (15)" 
- Download buttons show format: "Download Text Files (ZIP)" vs "Download JSON Files (ZIP)"
- Icons for clarity 📥 📄 📝

## Feature Comparison

### Single Assessment Mode

| Feature | Before | Now |
|---------|--------|-----|
| Input methods | Form only | Form OR JSON |
| Status updates | None | Real-time messages + timer |
| Download JSON | ❌ | ✅ Step 2 & 3 |
| Download assessment | ❌ | ✅ TXT & JSON options |
| Progress feedback | Generic loading | Detailed status per stage |

### Batch Processing Mode

| Feature | Before | Now |
|---------|--------|-----|
| Progress display | Percentage only | Count + file + timer |
| Status updates | Current file only | Detailed stage info |
| Download formats | TXT only | TXT & JSON options |
| Completion summary | Basic | Detailed with counts |
| File identification | Preserved | Enhanced with status |

## Usage Examples

### Example 1: Two-Stage Processing (Cost Savings!)
```
Stage 1: Generate JSON (cheap model)
1. Switch to Single Assessment
2. Use Form Input mode
3. Select GLM-4.5 (FREE) or Gemini Flash (cheap)
4. Paste student answer
5. Generate → Download JSON

Stage 2: Assess (premium model)
1. Switch to JSON Input mode
2. Select Claude Sonnet 4.5 (best quality)
3. Upload/paste the JSON from Stage 1
4. Generate Assessment
5. Download TXT or JSON

Cost: $0.02 (generation) + $0.08 (assessment) = $0.10
vs. $0.15 if using premium model for both
```

### Example 2: Batch Processing with Progress Monitoring
```
1. Upload 25 student PDFs
2. Start processing
3. Watch real-time:
   - "3 of 25 completed"
   - "Currently: Smith_John.pdf"
   - "⏱ Elapsed: 2m 15s"
   - "🤖 Analyzing legal writing..."
4. Complete: "20 successful, 5 errors"
5. Download as JSON for programmatic processing
   OR download as TXT for manual review
```

### Example 3: Archiving Complete Assessments
```
After assessment:
1. Download "Complete JSON" which includes:
   - Original question
   - Student answer
   - Model answer
   - Rubric
   - Full assessment feedback
2. Store in database or LMS
3. Can reprocess later or generate reports
```

## Technical Improvements

- **Timer System**: useEffect hook with setInterval for accurate time tracking
- **Status Management**: Centralized status state for consistent messages
- **Download Functions**: Separate helpers for JSON vs. text downloads
- **Format Options**: downloadBatchResults(format) parameter for flexibility
- **File Naming**: Preserves student filename, adds suffix (_assessment.txt, _complete.json)
- **Error Handling**: Failed files get _ERROR suffix for easy identification

## Breaking Changes

None! All changes are additions. Existing workflows continue to work exactly as before.

## Migration Guide

### If you're using the old version:
1. Download new version
2. Replace index.html
3. Everything works the same, plus new features!

### To use new features:
1. **JSON Mode**: Click "JSON Input" toggle before processing
2. **Download buttons**: Look for them at Step 2 and Step 3
3. **Batch formats**: Two download buttons instead of one

## Future Roadmap

Based on this feedback cycle, considering:
- [ ] Pause/Resume for batch processing
- [ ] Save progress locally (survive page refresh)
- [ ] Export to CSV for grade import
- [ ] Side-by-side comparison view
- [ ] Bulk JSON upload for batch mode
- [ ] Custom status webhooks

## Feedback Welcome!

These improvements came directly from user testing. Keep the feedback coming!

---

**Version 2.0** - October 2024
- All requested features implemented
- Zero breaking changes
- Fully backward compatible
