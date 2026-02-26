# /doc-user

Write end-user documentation, help center articles, and product documentation for non-technical audiences.

## Trigger

`/doc-user <action> [options]`

## Actions

### `write`
Generate a user-facing documentation article.

```bash
/doc-user write --feature "team management" --type walkthrough
/doc-user write --feature "billing" --type faq
/doc-user write --feature "data export" --type walkthrough --audience admin
/doc-user write --topic "Export not working" --type troubleshooting
```

### `review`
Analyze an article for plain language, task focus, and user experience issues.

```bash
/doc-user review docs/help/team-management.md
/doc-user review docs/help/ --check-vocabulary --check-steps
```

### `audit`
Audit a help center or doc set for coverage gaps and stale content.

```bash
/doc-user audit docs/help/ --check-coverage --check-freshness
/doc-user audit docs/help/ --compare-features features.md
```

### `faq`
Generate FAQ article from a list of questions or support ticket categories.

```bash
/doc-user faq --topic "billing" --questions "invoice,refund,upgrade,cancel"
/doc-user faq --from-tickets support-tickets.csv --category billing
```

## Options

| Option | Description |
|--------|-------------|
| `--feature <name>` | Product feature to document |
| `--type <type>` | walkthrough, overview, troubleshooting, faq |
| `--audience <type>` | end-user, admin, team-lead |
| `--topic <text>` | Topic for troubleshooting or FAQ |
| `--check-vocabulary` | Flag technical terms in user-facing language |
| `--check-steps` | Verify steps have one action each and show confirmation |

## Walkthrough Template

```markdown
# How to [accomplish task]

> **Who this is for**: [User type, e.g., "Team administrators" or "All users"]

[1-2 sentences: what this article helps you do and when you'd need it]

## Before you start

You'll need:
- [Specific role or permission required]
- [Any prerequisite setup, e.g., "A verified email address"]

## Steps

1. Click **[UI Label]** in the [location, e.g., "left sidebar" or "top navigation"].

   [Optional: what the user sees after this step, especially if a new screen loads]

2. Choose **[Option]** from the [menu/list/dropdown].

3. Type [what to type] in the **[Field Name]** field.

   [Hint about format if needed: "For example, team@company.com"]

4. Click **[Submit/Save/Continue]**.

A [confirmation indicator, e.g., "green checkmark" or "success message"] appears.
[What changes the user should see after completing the task]

## What's next

- [Logical follow-up action with link]
- [Related feature with link]

---

**Need help?** [Contact support](link) or [search the help center](link).
```

## Troubleshooting Template

```markdown
# Fix: [Problem as the user would describe it]

If [symptom -- match exactly what the user sees or experiences], try these solutions.

## [Most common cause -- describe the situation, not the cause]

This can happen when [explanation in plain language].

**To fix it:**

1. [Step 1]
2. [Step 2]

After completing these steps, [confirmation: what the user should see].

---

## [Second most common cause]

[Pattern continues]

---

## Still not working?

If none of the above solved it:

- Check our [status page](link) for any ongoing issues
- [Contact support](link) and include: [what info to share]
```

## FAQ Template

```markdown
# [Topic] FAQ

## General

### [Question exactly as users ask it?]

[Answer in the first sentence. Do not say "Great question" or "As mentioned above."]

[Optional: 1-2 sentences of additional context]

[Optional: Link to full article for complex topics]

---

### [Second question?]

[Pattern continues]

## [Second category]

### [Question?]

[Answer]
```

## Review Output

```
User Doc Review: team-management.md

VOCABULARY:
  [✗] Line 12: "navigate to" → use "go to"
  [✗] Line 23: "select from the dropdown" → use "choose"
  [✗] Line 31: "authenticate" → use "sign in"
  [✓] No technical jargon in remaining sections

STEPS:
  [✓] All steps start with action verbs
  [✗] Step 4 has two actions ("Click X and then click Y") -- split into two steps
  [✗] Step 7 shows no confirmation -- add what the user sees after completing it
  [✓] UI labels are bold

STRUCTURE:
  [✓] Prerequisites section present
  [✓] "What's next" section at end
  [✗] No troubleshooting note for common failure (missing permission)
  [✓] Support link present

RESULT: 5 issues. Priority: Fix Step 4 compound action + add post-step confirmation to Step 7.
```
