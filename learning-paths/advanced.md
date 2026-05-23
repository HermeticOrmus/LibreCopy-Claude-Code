# Advanced — content strategy + ops + i18n

## Content strategy

- Audit: existing pages, traffic, search queries that return nothing
- Lifecycle: per page, when reviewed, by whom, retention/archival policy
- Governance: who can publish, who reviews, what triggers re-review
- Metrics: time-on-page (not enough), task success (better), search refinement rate

## Docs ops

- Migration plans (between platforms, between versions)
- Translation pipelines (XLIFF, Crowdin, Smartling)
- Deprecation notices that actually reach users
- SLA on doc updates relative to product changes (target: same-day for new features)

## Internationalization

- Source language clarity: write for translation (short sentences, no idioms, no humor)
- Translation memory + glossary (consistency across translators)
- RTL handling for Arabic/Hebrew/Persian
- Locale-aware examples (dates, currencies, names)

## Doc-driven development

Write the docs BEFORE the code. The docs surface API questions early. Common in tools-team work (CLI design, SDK design).

## What's still hard

- Search that actually finds what users want (most search is bad)
- Visual documentation (screenshots) staying in sync with the product
- Documentation for AI-augmented products (the AI's behavior is fuzzy)
- Multi-product unified docs (when each product team owns its docs but users see the whole)
