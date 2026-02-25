# /doc-onboarding

A quick-access command for onboarding-docs workflows in Claude Code.

## Trigger

`/doc-onboarding [action] [options]`

## Input

### Actions
- `analyze` - Analyze existing onboarding-docs implementation
- `generate` - Generate new onboarding-docs artifacts
- `improve` - Suggest improvements to current implementation
- `validate` - Check implementation against best practices
- `document` - Generate documentation for onboarding-docs artifacts

### Options
- `--context <path>` - Specify the file or directory to operate on
- `--format <type>` - Output format (markdown, json, yaml)
- `--verbose` - Include detailed explanations
- `--dry-run` - Preview changes without applying them

## Process

### Step 1: Context Gathering
- Read relevant files and configuration
- Identify the current state of onboarding-docs artifacts
- Determine applicable standards and conventions

### Step 2: Analysis
- Evaluate against onboarding-patterns patterns
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
## Onboarding Docs - [Action] Complete

### Changes Made
- [List of changes]

### Validation
- [Checks passed]

### Next Steps
- [Recommended follow-up actions]
```

### Error
```
## Onboarding Docs - [Action] Failed

### Issue
[Description of the problem]

### Suggested Fix
[How to resolve the issue]
```

## Examples

```bash
# Analyze current implementation
/doc-onboarding analyze

# Generate new artifacts
/doc-onboarding generate --context ./src

# Validate against best practices
/doc-onboarding validate --verbose

# Generate documentation
/doc-onboarding document --format markdown
```
