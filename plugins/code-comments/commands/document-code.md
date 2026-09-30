---
description: "Add missing documentation comments to a file or directory in the right style for the language, or extract docs to a reference file, report coverage, or update comments that no longer match their signatures."
argument-hint: "[generate|extract|check-coverage|update] [--file path|--dir path] [--style name]"
---

# /document-code

> Add documentation comments (JSDoc, docstrings, rustdoc) to source code files.

Generate, extract, check coverage, and update code documentation comments.

## Trigger

`/document-code` -- invoked when source code needs documentation comments added or improved.

`/document-code <action> [options]`

With no action, `/document-code` runs `generate`, following the Process below.

## Actions

### `generate`
Add documentation comments to source code files.

```bash
/document-code generate --file src/auth.ts --style tsdoc
/document-code generate --dir src/services/ --style google-docstring
/document-code generate --file src/lib.rs --style rustdoc
/document-code generate --file pkg/server.go --style godoc
```

### `extract`
Extract existing documentation into a separate reference document.

```bash
/document-code extract --dir src/ --output docs/api-reference.md
/document-code extract --file src/client.ts --format markdown
```

### `check-coverage`
Report documentation coverage across a codebase.

```bash
/document-code check-coverage --dir src/ --threshold 80
/document-code check-coverage --dir src/ --only-public  # Only check exported symbols
```

### `update`
Update stale or incorrect documentation comments to match current signatures.

```bash
/document-code update --file src/auth.ts  # Detects signature/doc mismatches
/document-code update --dir src/ --fix-stale-todos  # Flag TODOs older than 90 days
```

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--file <path>` | No | Specific file to document (mutually exclusive with --dir) |
| `--dir <path>` | No | Directory to document recursively |
| `--style <format>` | No | Docstring style: `jsdoc`, `tsdoc`, `google-docstring`, `numpy-docstring`, `sphinx`, `rustdoc`, `godoc` (auto-detected from file extension if omitted) |
| `--public-only` | No | Only document exported/public symbols (default: false) |
| `--overwrite` | No | Replace existing docstrings (default: false, only adds missing) |

## Options for the actions

| Option | Description |
|--------|-------------|
| `--file <path>` | Single file to document |
| `--dir <path>` | Directory to process recursively |
| `--style <name>` | jsdoc, tsdoc, google-docstring, numpy-docstring, rustdoc, godoc |
| `--output <path>` | Output file for extract action |
| `--format <type>` | markdown, html (for extract action) |
| `--threshold <n>` | Minimum coverage percentage for check-coverage |
| `--only-public` | Limit to exported/public symbols only |

## Process

1. **Detection**
   - Identify language from file extension
   - Select appropriate docstring format (or use specified style)
   - Parse file to identify functions, classes, methods, interfaces, types
   - Check which symbols already have documentation

2. **Analysis**
   - For each undocumented symbol, analyze:
     - Function name and its semantic meaning
     - Parameter names, types, and default values
     - Return type and possible return values
     - Thrown exceptions or error returns
     - Side effects (I/O, mutations, network calls)
     - Complexity that warrants explanation

3. **Generation**
   - Write summary line (what the function does in one sentence)
   - Document each parameter with description (not just type repetition)
   - Document return value semantics
   - Document exceptions/errors with their trigger conditions
   - Add examples for non-obvious behavior
   - Add `@see` links to related functions or documentation

4. **Integration**
   - Insert docstrings at correct positions in the file
   - Preserve existing code formatting and indentation
   - Maintain existing docstrings unless --overwrite is specified

## Output

Modified source files with documentation comments added. Console summary:

```
Code Documented
  File: src/services/auth.ts
  Style: TSDoc
  Symbols Found: 12
  Already Documented: 4
  Newly Documented: 8
  Skipped (private): 0
```
## Coverage Report Example

```
Documentation Coverage: src/

File                    Public  Covered  Coverage
----------------------  ------  -------  --------
src/auth/session.ts        12       12    100.0%
src/api/client.ts          23       18     78.3%
src/utils/retry.ts          8        4     50.0%
src/models/user.ts         15        7     46.7%
src/internal/cache.ts       3        0      0.0%  [skipped - internal]

Total (public symbols):    58       41     70.7%

THRESHOLD: 80% - FAILED (70.7% < 80%)

Undocumented public symbols:
  src/api/client.ts:45    createBatch()
  src/api/client.ts:89    retryWithBackoff()
  src/utils/retry.ts:12   calculateDelay()
  src/utils/retry.ts:34   shouldRetry()
```

## JSDoc Template

```typescript
/**
 * [One-line imperative summary. "Creates X", "Returns Y", "Validates Z"]
 *
 * [Optional: longer description for non-obvious behavior, edge cases,
 * or important constraints. Skip if the summary is sufficient.]
 *
 * @param paramName - [Semantic meaning, not type echo. What does it represent?
 *   What are the constraints? What happens at the boundaries?]
 * @returns [What it represents. Edge cases (returns null when X, empty array when Y).]
 * @throws {ErrorType} [When this is thrown. Be specific about the condition.]
 *
 * @example
 * ```typescript
 * // [Describe the scenario]
 * const result = functionName(input);
 * // result === expectedOutput
 * ```
 *
 * @since [version when added, if relevant]
 * @deprecated [Replacement path if deprecated]
 */
```

## Google Python Docstring Template

```python
def function_name(param1: type, param2: type = default) -> return_type:
    """One-line imperative summary.

    Optional longer description for non-obvious behavior. Use when
    the one-liner is not sufficient to convey the function's contract.

    Args:
        param1: Semantic meaning. What it represents, not its type.
            Continuation lines indented by 4 spaces.
        param2: Description including the default behavior.

    Returns:
        What is returned. Include edge cases (None when not found,
        empty list when no matches, etc.).

    Raises:
        ValueError: When param1 is negative or param2 is empty.
        IOError: When the underlying resource is unavailable.

    Example:
        >>> function_name("input", param2=42)
        expected_output
    """
```
