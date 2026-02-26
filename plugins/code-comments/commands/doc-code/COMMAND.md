# /doc-code

Generate, extract, check coverage, and update code documentation comments.

## Trigger

`/doc-code <action> [options]`

## Actions

### `generate`
Add documentation comments to source code files.

```bash
/doc-code generate --file src/auth.ts --style tsdoc
/doc-code generate --dir src/services/ --style google-docstring
/doc-code generate --file src/lib.rs --style rustdoc
/doc-code generate --file pkg/server.go --style godoc
```

### `extract`
Extract existing documentation into a separate reference document.

```bash
/doc-code extract --dir src/ --output docs/api-reference.md
/doc-code extract --file src/client.ts --format markdown
```

### `check-coverage`
Report documentation coverage across a codebase.

```bash
/doc-code check-coverage --dir src/ --threshold 80
/doc-code check-coverage --dir src/ --only-public  # Only check exported symbols
```

### `update`
Update stale or incorrect documentation comments to match current signatures.

```bash
/doc-code update --file src/auth.ts  # Detects signature/doc mismatches
/doc-code update --dir src/ --fix-stale-todos  # Flag TODOs older than 90 days
```

## Options

| Option | Description |
|--------|-------------|
| `--file <path>` | Single file to document |
| `--dir <path>` | Directory to process recursively |
| `--style <name>` | jsdoc, tsdoc, google-docstring, numpy-docstring, rustdoc, godoc |
| `--output <path>` | Output file for extract action |
| `--format <type>` | markdown, html (for extract action) |
| `--threshold <n>` | Minimum coverage percentage for check-coverage |
| `--only-public` | Limit to exported/public symbols only |

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
