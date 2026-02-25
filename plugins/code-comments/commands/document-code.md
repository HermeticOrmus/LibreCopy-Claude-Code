# /document-code

> Add documentation comments (JSDoc, docstrings, rustdoc) to source code files.

## Trigger

`/document-code` -- invoked when source code needs documentation comments added or improved.

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--file <path>` | No | Specific file to document (mutually exclusive with --dir) |
| `--dir <path>` | No | Directory to document recursively |
| `--style <format>` | No | Docstring style: `jsdoc`, `tsdoc`, `google-docstring`, `numpy-docstring`, `sphinx`, `rustdoc`, `godoc` (auto-detected from file extension if omitted) |
| `--public-only` | No | Only document exported/public symbols (default: false) |
| `--overwrite` | No | Replace existing docstrings (default: false, only adds missing) |

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
