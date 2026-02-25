# /doc-cli

A quick-access command for cli-help-text workflows in Claude Code.

## Trigger

`/doc-cli [action] [options]`

## Input

### Actions
- `analyze` - Analyze existing cli-help-text implementation
- `generate` - Generate new cli-help-text artifacts
- `improve` - Suggest improvements to current implementation
- `validate` - Check implementation against best practices
- `document` - Generate documentation for cli-help-text artifacts

### Options
- `--context <path>` - Specify the file or directory to operate on
- `--format <type>` - Output format (markdown, json, yaml)
- `--verbose` - Include detailed explanations
- `--dry-run` - Preview changes without applying them

## Process

### Step 1: Context Gathering
- Read relevant files and configuration
- Identify the current state of cli-help-text artifacts
- Determine applicable standards and conventions

### Step 2: Analysis
- Evaluate against cli-help-patterns patterns
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
## Cli Help Text - [Action] Complete

### Changes Made
- [List of changes]

### Validation
- [Checks passed]

### Next Steps
- [Recommended follow-up actions]
```

### Error
```
## Cli Help Text - [Action] Failed

### Issue
[Description of the problem]

### Suggested Fix
[How to resolve the issue]
```

## Examples

```bash
# Analyze current implementation
/doc-cli analyze

# Generate new artifacts
/doc-cli generate --context ./src

# Validate against best practices
/doc-cli validate --verbose

# Generate documentation
/doc-cli document --format markdown
```
