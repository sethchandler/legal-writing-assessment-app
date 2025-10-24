# Legal Writing Assessment Tool - Workflow

## System Architecture

```
┌─────────────────────────────────────────────────────────┐
│                     USER'S BROWSER                      │
│  ┌───────────────────────────────────────────────────┐  │
│  │         React Application (index.html)           │  │
│  │                                                   │  │
│  │  ┌─────────────┐  ┌─────────────┐  ┌──────────┐ │  │
│  │  │   Step 1    │─▶│   Step 2    │─▶│  Step 3  │ │  │
│  │  │ Input Data  │  │ Generate    │  │ Assess   │ │  │
│  │  │             │  │ JSON        │  │ Answer   │ │  │
│  │  └─────────────┘  └─────────────┘  └──────────┘ │  │
│  │                                                   │  │
│  │  ┌──────────────────────────────────────────┐    │  │
│  │  │      localStorage (API Keys)             │    │  │
│  │  └──────────────────────────────────────────┘    │  │
│  └───────────────────────────────────────────────────┘  │
│                          │                              │
│                          │ Direct API Calls             │
│                          ▼                              │
└──────────────────────────┼──────────────────────────────┘
                           │
         ┌─────────────────┴─────────────────┐
         │                                   │
         ▼                                   ▼
┌─────────────────┐               ┌──────────────────┐
│  Anthropic API  │               │   OpenAI API     │
│  (Claude)       │               │   (GPT-4)        │
└─────────────────┘               └──────────────────┘
```

## Data Flow

### Step 1: Input Data
```
User Input:
├── Question (optional)
├── Student Answer (required)
├── Model Answer (optional)
└── Rubric (optional)

↓

Stored in Component State:
{
  question: string,
  studentAnswer: string,
  modelAnswer: string,
  rubric: string
}
```

### Step 2: Generate JSON

#### Phase 2a: Missing Field Detection
```
Check formData for empty fields
↓
missing = []
if (!question) missing.push('question')
if (!modelAnswer) missing.push('modelAnswer')  
if (!rubric) missing.push('rubric')
```

#### Phase 2b: Sequential AI Generation
```
FOR EACH missing field IN ORDER:

  IF field === 'question':
    ┌────────────────────────────────┐
    │ Prompt: Generate question      │
    │ from student answer            │
    └────────────────────────────────┘
    ↓
    [API Call to LLM]
    ↓
    Update formData.question
    
  IF field === 'modelAnswer':
    ┌────────────────────────────────┐
    │ Prompt: Generate model answer  │
    │ from question + student answer │
    └────────────────────────────────┘
    ↓
    [API Call to LLM]
    ↓
    Update formData.modelAnswer
    
  IF field === 'rubric':
    ┌────────────────────────────────┐
    │ Prompt: Generate rubric        │
    │ from question                  │
    └────────────────────────────────┘
    ↓
    [API Call to LLM]
    ↓
    Update formData.rubric

END FOR
```

#### Phase 2c: JSON Creation
```
jsonData = {
  question: formData.question,
  studentAnswer: formData.studentAnswer,
  modelAnswer: formData.modelAnswer,
  rubric: formData.rubric,
  metadata: {
    generatedAt: timestamp,
    generatedFields: [list of generated fields]
  }
}
```

### Step 3: Assessment

```
Assessment Prompt Construction:
┌───────────────────────────────────────┐
│ System Instructions:                  │
│ - Legal writing expert                │
│ - Use IRAC/CREAC framework           │
│ - Identify conclusory statements      │
│ - Provide Socratic feedback           │
└───────────────────────────────────────┘
↓
┌───────────────────────────────────────┐
│ Context from jsonData:                │
│ - Question                            │
│ - Student Answer                      │
│ - Model Answer                        │
│ - Rubric                              │
└───────────────────────────────────────┘
↓
[API Call to LLM]
↓
┌───────────────────────────────────────┐
│ Assessment Output:                    │
│ - Framework detection                 │
│ - Component analysis                  │
│ - Strengths                           │
│ - Areas for improvement               │
│ - Socratic questions                  │
│ - Scoring                             │
└───────────────────────────────────────┘
```

## API Integration

### Anthropic (Claude)
```javascript
fetch('https://api.anthropic.com/v1/messages', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'x-api-key': apiKey,
    'anthropic-version': '2023-06-01'
  },
  body: JSON.stringify({
    model: 'claude-sonnet-4-20250514',
    max_tokens: 4000,
    messages: [{ role: 'user', content: prompt }]
  })
})
```

### OpenAI (GPT-4)
```javascript
fetch('https://api.openai.com/v1/chat/completions', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${apiKey}`
  },
  body: JSON.stringify({
    model: 'gpt-4-turbo-preview',
    messages: [{ role: 'user', content: prompt }],
    max_tokens: 4000
  })
})
```

## State Management

```
React Component State:
┌─────────────────────────────────────┐
│ step: 1 | 2 | 3                     │ // Current workflow step
├─────────────────────────────────────┤
│ formData: {                         │
│   question: string,                 │
│   studentAnswer: string,            │
│   modelAnswer: string,              │
│   rubric: string                    │
│ }                                   │
├─────────────────────────────────────┤
│ provider: 'anthropic' | 'openai'    │ // Selected AI provider
├─────────────────────────────────────┤
│ apiKey: string                      │ // Stored in localStorage
├─────────────────────────────────────┤
│ model: string                       │ // Selected model
├─────────────────────────────────────┤
│ loading: boolean                    │ // API call in progress
├─────────────────────────────────────┤
│ error: string                       │ // Error message
├─────────────────────────────────────┤
│ jsonData: object | null             │ // Generated JSON
├─────────────────────────────────────┤
│ assessment: string | null           │ // Final assessment
└─────────────────────────────────────┘
```

## User Journey Map

### Journey 1: Faculty Grading (Minimal Input)
```
1. Open app
2. Enter API key (once)
3. Paste student answer
4. Click "Generate Assessment Data"
   → AI generates question, model answer, rubric
5. Review generated JSON
6. Click "Perform Assessment"
   → AI evaluates using legal writing framework
7. Review comprehensive feedback
8. Download JSON for records
9. Copy feedback to gradebook
```

### Journey 2: Student Self-Assessment
```
1. Open app
2. Enter API key (once)
3. Paste exam question
4. Paste their answer
5. Click "Generate Assessment Data"
   → AI generates model answer and rubric
6. Click "Perform Assessment"
   → AI provides Socratic feedback
7. Review identified issues
8. Work through guiding questions
9. Revise answer
10. Reassess (repeat from step 4)
```

### Journey 3: Full Control Assessment
```
1. Open app
2. Enter API key (once)
3. Provide all four fields:
   - Question
   - Student answer
   - Model answer
   - Custom rubric
4. Click "Generate Assessment Data"
   → No AI generation needed, creates JSON
5. Click "Perform Assessment"
   → AI evaluates using provided context
6. Most accurate and targeted feedback
```

## Error Handling

```
Try-Catch Blocks:
├── API Key Missing
│   └── Show: "Please provide an API key first"
├── Network Error
│   └── Show: API error message
├── Invalid JSON Response
│   └── Show: "Failed to parse response"
├── Rate Limit Exceeded
│   └── Show: "Rate limit hit, please wait"
└── Unknown Error
    └── Show: Generic error with details
```

## Performance Considerations

### API Calls per Assessment

**Scenario A**: Only student answer provided
- Call 1: Generate question
- Call 2: Generate model answer
- Call 3: Generate rubric
- Call 4: Perform assessment
- **Total: 4 calls**

**Scenario B**: Question + student answer provided
- Call 1: Generate model answer
- Call 2: Generate rubric
- Call 3: Perform assessment
- **Total: 3 calls**

**Scenario C**: All fields provided
- Call 1: Perform assessment
- **Total: 1 call**

### Cost Optimization
```
To minimize costs:
├── Provide question → Save 1 call
├── Provide model answer → Save 1 call
├── Provide rubric → Save 1 call
└── Reuse rubrics → Amortize generation cost
```

## Security Model

```
Security Principles:
├── No backend server → No server vulnerabilities
├── localStorage only → Data stays in browser
├── Direct API calls → No intermediary data exposure
├── No analytics → No tracking
└── Open source → Auditable code
```

## Deployment Pipeline

```
Local Changes
↓
git push origin main
↓
GitHub Actions Triggered
↓
Build GitHub Pages
↓
Deploy to https://[user].github.io/[repo]
↓
Live in 1-2 minutes
```

---

This architecture ensures simplicity, privacy, and zero maintenance costs while providing powerful legal writing assessment capabilities.
