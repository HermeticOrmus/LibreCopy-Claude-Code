# Beginner Learning Path - Technical Writing & Documentation

## Overview

This path builds the foundation of technical writing for software projects. You will learn how to write clearly for developer audiences, structure documentation effectively, and produce content that empowers users rather than confusing them. By the end, you will be able to write README files, setup guides, and basic API references that people actually want to read.

## Prerequisites

- Basic familiarity with any programming language
- Ability to use a text editor and terminal
- Understanding of Markdown syntax (or willingness to learn it in Module 1)

## Modules

### Module 1: Markdown and Structured Writing

#### Concepts

- Markdown as the lingua franca of developer documentation
- Headings create hierarchy, not decoration: H1 for page title, H2 for sections, H3 for subsections
- Code blocks with language hints for syntax highlighting
- Tables for structured comparisons
- Links: relative for internal docs, absolute for external references
- The difference between writing to impress and writing to inform

#### Hands-On Exercise

Create a `CONTRIBUTING.md` file for a fictional open-source project. Include:

1. A clear title and one-sentence project description
2. A "Getting Started" section with numbered setup steps
3. A code block showing how to run tests
4. A table comparing branch naming conventions
5. Links to related documents (even if they do not exist yet)

Constraint: Keep it under 80 lines. Every sentence must serve a purpose.

#### Key Takeaways

- Markdown is a tool, not a style: consistency matters more than flair
- Numbered steps for sequential actions, bullet points for unordered lists
- Code blocks are not optional when referencing commands or code

### Module 2: Writing for Developer Audiences

#### Concepts

- Developers scan before they read: structure for scanning
- The inverted pyramid: most important information first
- Imperative mood for instructions ("Run the command" not "You should run the command")
- Avoiding ambiguity: "click the button" vs "click the Submit button in the top-right corner"
- Jargon management: use domain terms precisely, define them once, never invent new ones
- Second person ("you") for tutorials, third person for reference docs
- Active voice over passive voice: "The server processes the request" not "The request is processed"

#### Hands-On Exercise

Take an existing README from any open-source project and rewrite it. Apply these rules:

1. Cut word count by 30% without losing information
2. Replace every passive voice sentence with active voice
3. Add a "Quick Start" section that gets someone from zero to running in under 60 seconds
4. Ensure every heading is scannable (a reader should understand the page structure from headings alone)

Compare your version with the original. Note what you cut and why.

#### Key Takeaways

- Brevity is respect for the reader's time
- Every paragraph should answer "why should I care?" within two sentences
- If a sentence does not help the reader accomplish something, delete it

### Module 3: Documentation Fundamentals

#### Concepts

- The four types of documentation (Diataxis framework):
  - **Tutorials**: Learning-oriented, hold the reader's hand
  - **How-to guides**: Task-oriented, assume basic knowledge
  - **Reference**: Information-oriented, complete and accurate
  - **Explanation**: Understanding-oriented, provide context and reasoning
- File and folder conventions: `docs/`, `README.md`, `CHANGELOG.md`, `CONTRIBUTING.md`
- Versioning documentation alongside code
- The README as the front door of your project
- Documentation debt: what happens when docs rot

#### Hands-On Exercise

For a project you are working on (or a fictional one), create the documentation skeleton:

```
docs/
  getting-started.md
  how-to/
    deploy.md
    configure.md
  reference/
    api.md
    config-options.md
  explanation/
    architecture.md
README.md
CONTRIBUTING.md
CHANGELOG.md
```

Write the first three paragraphs of each file. Focus on clearly establishing what each document is for and who it is for.

#### Key Takeaways

- Different documents serve different purposes; mixing types confuses readers
- A good README answers: What is this? Why should I care? How do I start?
- Documentation is a product, not an afterthought

## Assessment

You have completed the beginner path when you can:

1. Write a README that a stranger can follow to set up and use a project without asking questions
2. Identify which Diataxis category a document belongs to
3. Rewrite a paragraph to cut 30% of words while keeping all meaning
4. Structure a documentation folder that scales as the project grows
5. Receive feedback on your writing without taking it personally (this is the hardest one)

## Next Steps

- Move to the **Intermediate Path**: API documentation, style guides, and docs-as-code workflows
- Read "Docs for Developers" by Jared Bhatti et al. for deeper theory
- Contribute documentation to an open-source project you use
- Start a writing habit: document one thing you learned today, every day
