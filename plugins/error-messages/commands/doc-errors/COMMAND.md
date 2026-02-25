# /doc-errors

A quick-access command for error-messages workflows in Claude Code.

## Trigger

`/doc-errors [action] [options]`

## Input

### Actions
- `analyze` - Analyze existing error-messages implementation
- `generate` - Generate new error-messages artifacts
- `improve` - Suggest improvements to current implementation
- `validate` - Check implementation against best practices
- `document` - Generate documentation for error-messages artifacts

### Options
- `--context <path>` - Specify the file or directory to operate on
- `--format <type>` - Output format (markdown, json, yaml)
- `--verbose` - Include detailed explanations
- `--dry-run` - Preview changes without applying them

## Process

### Step 1: Context Gathering
- Read relevant files and configuration
- Identify the current state of error-messages artifacts
- Determine applicable standards and conventions

### Step 2: Analysis
- Evaluate against error-message-patterns patterns
- Identify gaps, issues, and opportunities
- Prioritize findings by impact and effort

### Step 3: Execution
- Apply the requested action
- Generate or modify artifacts as needed
- Validate changes against requirements

### Step 4: Output
- Present results in the requested format
- Include actionable next steps
- Flag any items requiring human decision

## Output

### Success
```
## Error Messages - [Action] Complete

### Changes Made
- [List of changes]

### Validation
- [Checks passed]

### Next Steps
- [Recommended follow-up actions]
```

### Error
```
## Error Messages - [Action] Failed

### Issue
[Description of the problem]

### Suggested Fix
[How to resolve the issue]
```

## Examples

```bash
# Analyze current implementation
/doc-errors analyze

# Generate new artifacts
/doc-errors generate --context ./src

# Validate against best practices
/doc-errors validate --verbose

# Generate documentation
/doc-errors document --format markdown
```
