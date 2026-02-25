# /user-doc

> Generate user-facing documentation for a feature, workflow, or product area.

## Trigger

`/user-doc` -- invoked when end-user documentation needs to be created or updated.

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--feature <name>` | Yes | Feature or area to document (e.g., "team management", "billing") |
| `--type <format>` | No | Doc type: `walkthrough`, `faq`, `overview`, `troubleshooting` (default: `walkthrough`) |
| `--audience <level>` | No | Target audience: `end-user`, `admin`, `power-user` (default: `end-user`) |
| `--output <path>` | No | Output path (default: `./docs/user/`) |

## Process

1. **Feature Analysis**
   - Understand the feature's purpose and user workflows
   - Identify the user tasks this feature enables
   - Map the UI flow for each task
   - Identify prerequisites and permissions

2. **Content Generation**
   - Write task-oriented articles for each user workflow
   - Create step-by-step procedures with UI element references
   - Add prerequisite sections where needed
   - Write FAQ entries for common questions
   - Include troubleshooting for common issues

3. **Accessibility Review**
   - Verify plain language (grade 8 reading level)
   - Ensure screenshots have alt text markers
   - Check that all UI labels are bolded and exact

## Output

User documentation articles:

```
User Documentation Created
  Feature: Team Management
  Articles: 4 (Invite Member, Change Role, Remove Member, FAQ)
  Type: Walkthrough
  Reading Level: Grade 7
  Output: docs/user/team-management/
```
