# /write-spec

A quick-access command for specification-writing workflows in Claude Code.

## Trigger

`/write-spec [action] [options]`

## Input

### Actions
- `analyze` - Analyze existing specification-writing implementation
- `generate` - Generate new specification-writing artifacts
- `improve` - Suggest improvements to current implementation
- `validate` - Check implementation against best practices
- `document` - Generate documentation for specification-writing artifacts

### Options
- `--context <path>` - Specify the file or directory to operate on
- `--format <type>` - Output format (markdown, json, yaml)
- `--verbose` - Include detailed explanations
- `--dry-run` - Preview changes without applying them

## Process

### Step 1: Context Gathering
- Read relevant files and configuration
- Identify the current state of specification-writing artifacts
- Determine applicable standards and conventions

### Step 2: Analysis
- Evaluate against spec-writing-patterns patterns
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
## Specification Writing - [Action] Complete

### Changes Made
- [List of changes]

### Validation
- [Checks passed]

### Next Steps
- [Recommended follow-up actions]
```

### Error
```
## Specification Writing - [Action] Failed

### Issue
[Description of the problem]

### Suggested Fix
[How to resolve the issue]
```

## Examples

```bash
# Analyze current implementation
/write-spec analyze

# Generate new artifacts
/write-spec generate --context ./src

# Validate against best practices
/write-spec validate --verbose

# Generate documentation
/write-spec document --format markdown
```
