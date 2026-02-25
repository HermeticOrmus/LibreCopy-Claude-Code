# Changelog

All notable changes to LibreCopy-Claude-Code will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-02-24

### Added

- Initial release with 20 documentation plugins covering the full spectrum of technical writing:
  - **Developer Docs:** api-documentation, readme-engineering, changelog-management, developer-guides, architecture-docs
  - **User-Facing:** tutorial-creation, user-documentation, onboarding-docs, knowledge-bases, error-messages
  - **Technical Writing:** technical-blogging, style-guides, content-strategy, specification-writing, proposal-writing
  - **Code & CLI:** code-comments, cli-help-text, release-notes, runbook-writing, documentation-testing
- Learning paths organized by difficulty:
  - Beginner: clear writing, README structure, basic formatting, documentation vocabulary
  - Intermediate: style guides, doc-as-code workflows, component library docs, information architecture
  - Advanced: doc automation, versioned docs, i18n, documentation testing, content strategy
- 3 automated hooks for documentation workflow integration:
  - session-start: detects documentation tools, README presence, API schemas
  - pre-tool-use: warns about consistency, cross-references, audience
  - post-tool-use: checks for common documentation issues
- Documentation-focused CLAUDE.md template for project configuration
- Project infrastructure: MIT license, contributing guidelines, code of conduct, issue templates
