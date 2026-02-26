# /doc-cli

Generate help text, man pages, and test CLI documentation.

## Trigger

`/doc-cli <action> [options]`

## Actions

### `generate`
Generate `--help` output text or man page from source code or description.

```bash
/doc-cli generate --from-source ./src/cli.py --format help-text
/doc-cli generate --from-cobra ./cmd/ --format man-page
/doc-cli generate --describe "A tool that compresses log files" --format help-text
```

### `validate`
Check help text against POSIX/GNU conventions.

```bash
/doc-cli validate "$(mycli --help)"
/doc-cli validate ./docs/mycli.1  --format man-page
```

### `man-page`
Generate a full man page skeleton or complete from existing help text.

```bash
/doc-cli man-page --name mycli --section 1 --description "File compression utility"
/doc-cli man-page --from-help "$(mycli --help)" --output ./docs/mycli.1
```

### `test`
Generate BATS test cases for CLI behavior.

```bash
/doc-cli test --from-help "$(mycli --help)" --output ./test/mycli.bats
/doc-cli test --command mycli --scenario "happy path, invalid args, missing required"
```

## Options

| Option | Description |
|--------|-------------|
| `--from-source <path>` | Parse CLI definition from source code |
| `--from-help <text>` | Use existing help text as input |
| `--format <type>` | help-text, man-page, markdown (default: help-text) |
| `--output <path>` | Output file (default: stdout) |
| `--section <n>` | Man page section number (default: 1) |
| `--name <name>` | Command name for man page |

## Help Text Template

```
USAGE: <command> [OPTIONS] [ARGS]...

  <One sentence: what the command does (not how).>

OPTIONS:
  -f, --flag              Boolean flag description [default: off]
  -v, --value TEXT        Option requiring a value [default: default_value]
  -r, --required TEXT     Required option (no default)  [required]
  -m, --multi TEXT        Option that can be specified multiple times
  -h, --help              Show this message and exit
  --version               Show the version and exit

ARGUMENTS:
  SOURCE  Path to source file (required)
  TARGET  Path to output file [default: stdout]

EXAMPLES:
  # Most common use case
  <command> input.txt

  # With output file
  <command> input.txt --output result.txt

  # With all options
  <command> input.txt --output result.txt --value custom --flag

ENVIRONMENT VARIABLES:
  <COMMAND>_TOKEN    Authentication token
  <COMMAND>_CONFIG   Path to config file [default: ~/.commandrc]

EXIT CODES:
  0  Success
  1  Error
  2  Invalid arguments
```

## Man Page Skeleton (nroff)

```nroff
.TH MYCLI 1 "2025-04-01" "mycli 1.5.0" "User Commands"
.SH NAME
mycli \- brief one-line description of what mycli does
.SH SYNOPSIS
.B mycli
[\fIOPTIONS\fR]
[\fIFILE\fR...]
.SH DESCRIPTION
.PP
Longer description of the command. Explain what problem it solves,
not how it is implemented.
.SH OPTIONS
.TP
\fB\-v\fR, \fB\-\-verbose\fR
Enable verbose output. Can be specified multiple times to increase verbosity.
.TP
\fB\-o\fR \fIFILE\fR, \fB\-\-output\fR=\fIFILE\fR
Write output to FILE instead of stdout.
.TP
\fB\-h\fR, \fB\-\-help\fR
Display this help text and exit.
.TP
\fB\-\-version\fR
Display version information and exit.
.SH EXAMPLES
.PP
Process a single file:
.IP
.nf
mycli input.txt
.fi
.PP
Process multiple files with verbose output:
.IP
.nf
mycli --verbose *.log
.fi
.SH ENVIRONMENT
.TP
\fBMYCLI_CONFIG\fR
Path to configuration file. Default: ~/.myclirc
.TP
\fBMYCLI_TOKEN\fR
Authentication token. Overrides the token in the config file.
.SH EXIT STATUS
.TP
\fB0\fR
Success.
.TP
\fB1\fR
General error.
.TP
\fB2\fR
Invalid arguments.
.SH SEE ALSO
.BR mycli-config (5),
.BR mycli-plugins (7)
```

## BATS Test Template

```bash
#!/usr/bin/env bats

setup() {
  load 'test_helper/bats-support/load'
  load 'test_helper/bats-assert/load'
}

@test "shows help with --help flag" {
  run mycli --help
  assert_success
  assert_output --partial "USAGE:"
  assert_output --partial "--help"
}

@test "shows version with --version flag" {
  run mycli --version
  assert_success
  assert_output --regexp "^mycli [0-9]+\.[0-9]+\.[0-9]+"
}

@test "fails with exit code 2 on missing required argument" {
  run mycli
  assert_failure 2
  assert_output --partial "Missing required argument"
}

@test "processes file successfully" {
  run mycli fixtures/sample.txt
  assert_success
  assert_output --partial "processed"
}
```
