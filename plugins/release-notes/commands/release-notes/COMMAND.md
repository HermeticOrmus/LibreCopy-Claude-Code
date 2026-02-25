# /release-notes

A quick-access command for release-notes workflows in Claude Code.

## Trigger

`/release-notes [action] [options]`

## Input

### Actions
- `analyze` - Analyze existing release-notes implementation
- `generate` - Generate new release-notes artifacts
- `improve` - Suggest improvements to current implementation
- `validate` - Check implementation against best practices
- `document` - Generate documentation for release-notes artifacts

### Options
- `--context <path>` - Specify the file or directory to operate on
- `--format <type>` - Output format (markdown, json, yaml)
- `--verbose` - Include detailed explanations
- `--dry-run` - Preview changes without applying them

## Process

### Step 1: Context Gathering
- Read relevant files and configuration
- Identify the current state of release-notes artifacts
- Determine applicable standards and conventions

### Step 2: Analysis
- Evaluate against release-note-patterns patterns
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
## Release Notes - [Action] Complete

### Changes Made
- [List of changes]

### Validation
- [Checks passed]

### Next Steps
- [Recommended follow-up actions]
```

### Error
```
## Release Notes - [Action] Failed

### Issue
[Description of the problem]

### Suggested Fix
[How to resolve the issue]
```

## Examples

```bash
# Analyze current implementation
/release-notes analyze

# Generate new artifacts
/release-notes generate --context ./src

# Validate against best practices
/release-notes validate --verbose

# Generate documentation
/release-notes document --format markdown
```
