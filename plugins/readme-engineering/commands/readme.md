# /readme

> Generate or overhaul a project README with proper structure, badges, and content.

## Trigger

`/readme` -- invoked when creating a new README or restructuring an existing one.

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--type <project>` | No | Project type: `library`, `cli`, `saas`, `framework`, `plugin`, `monorepo` |
| `--badges <list>` | No | Comma-separated badge types: `ci`, `coverage`, `npm`, `license`, `downloads` |
| `--sections <list>` | No | Custom section order (comma-separated) |
| `--tone <style>` | No | Writing tone: `professional`, `friendly`, `minimal` (default: `professional`) |
| `--output <path>` | No | Output path (default: `./README.md`) |

## Process

1. **Project Analysis**
   - Read package.json, Cargo.toml, go.mod, pyproject.toml for project metadata
   - Scan directory structure to understand project organization
   - Identify project type if not specified (library vs CLI vs app)
   - Read existing README if present (for update, not replacement)
   - Check for CI config, test setup, license file

2. **Structure Selection**
   - Choose template based on project type
   - Determine which sections are relevant (skip "Deploy" for a library)
   - Order sections by reader journey: understand, install, use, contribute
   - Identify content that can be auto-generated vs needs human input

3. **Content Generation**
   - Write title and one-line description from package metadata
   - Generate badge row based on detected services
   - Create install section from package manager config
   - Write quick start from existing examples or main exports
   - Build API overview from exported functions/classes
   - Generate contributing section from existing CONTRIBUTING.md or template
   - Add license section from LICENSE file

4. **Quality Check**
   - Verify all links are valid
   - Ensure code examples are syntactically correct
   - Check that badge URLs use correct owner/repo
   - Confirm heading hierarchy is valid (no h3 before h2)

## Output

A complete README.md file ready for the repository root. Placeholder sections are marked with `<!-- TODO: ... -->` comments for the developer to fill in.
