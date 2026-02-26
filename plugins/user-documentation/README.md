# User Documentation Plugin

> Write end-user documentation, help center articles, and product documentation that non-technical users can follow without calling support.

## Purpose

User documentation serves a different audience than developer documentation. Users want to accomplish a task -- they do not want to understand how the system works. This plugin produces task-oriented, plain-language documentation: walkthroughs, overviews, troubleshooting guides, and FAQs that use the user's vocabulary (not the engineer's), name UI elements exactly as labeled, and guide users from start to confirmed success.

## Agents

| Agent | Role |
|-------|------|
| `user-doc-writer` | Walkthroughs, overviews, troubleshooting, FAQ articles |

## Commands

| Command | Description |
|---------|-------------|
| `/doc-user write` | Generate a user-facing documentation article |
| `/doc-user review` | Analyze an article for plain language and user experience |
| `/doc-user audit` | Audit a help center for coverage gaps and staleness |
| `/doc-user faq` | Generate FAQ article from questions or support tickets |

## Skills

| Skill | Description |
|-------|-------------|
| `user-doc-patterns` | Task-first titles, vocabulary rules, article types, screenshot guidelines, anti-patterns |

## Quick Start

```bash
# Write a walkthrough for a feature
/doc-user write --feature "team management" --type walkthrough

# Write a troubleshooting article
/doc-user write --topic "Invoice shows wrong amount" --type troubleshooting

# Write a FAQ for a billing section
/doc-user faq --topic "billing" --questions "invoice,refund,upgrade,cancel"

# Review existing docs for plain language
/doc-user review docs/help/team-management.md --check-vocabulary --check-steps
```

## Article Type Guide

| Type | Use When | Title Pattern |
|------|----------|---------------|
| Walkthrough | User needs to complete a task | "How to [accomplish task]" |
| Overview | User needs context before acting | "[Feature name] overview" |
| Troubleshooting | User has encountered a specific problem | "Fix: [problem as user describes it]" |
| FAQ | Many small questions about a topic | "[Topic] FAQ" |

## User Doc Quality Checklist

Every article this plugin generates:

- [ ] Title is task-oriented ("How to export data" not "Data Export")
- [ ] No technical jargon: no "navigate", "authenticate", "select from dropdown", "renders"
- [ ] UI elements are bold: Click **Save Changes**
- [ ] Navigation paths use >: **Settings** > **Team** > **Permissions**
- [ ] Each step has one action (no "and" in steps)
- [ ] Steps show what the user sees after completing them
- [ ] Prerequisites listed before step 1
- [ ] Confirmation: how does the user know the task succeeded?
- [ ] "What's next" section guides the user forward
- [ ] Support escape hatch: link to contact support at the end

## Vocabulary Replacements

| Avoid | Use |
|-------|-----|
| authenticate | sign in |
| navigate to | go to |
| select from dropdown | choose |
| input / enter | type |
| renders / displays | shows |
| persists | saves |
| configuration | settings |
| toggle | turn on / turn off |
| modal / dialog | window or popup |
