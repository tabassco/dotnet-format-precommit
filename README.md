# dotnet-format Pre-commit Hook

A pre-commit hook that checks if C# files are properly formatted using `dotnet format`.

## Features

- Checks C# files for formatting issues
- Fails the commit if formatting changes are needed
- Provides clear error messages about which files need formatting

## Prerequisites

- [pre-commit](https://pre-commit.com/) installed
- .NET SDK with `dotnet format` available

## Usage

Add this to your `.pre-commit-config.yaml`:

```yaml
repos:
  - repo: https://github.com/tabassco/dotnet-format-precommit
    rev: v1.0.0  # Use the latest version tag
    hooks:
      - id: dotnet-format-check
```

Then install the hook:

```bash
pre-commit install
```

## How It Works

When you attempt to commit C# files, this hook will:

1. Run `dotnet format` on the staged C# files
2. Check if any formatting changes were made
3. If changes were detected:
   - Fail the commit
   - Display which files need formatting
   - Prompt you to run `dotnet format` manually
4. If no changes were needed, allow the commit to proceed

## Manual Formatting

If the hook fails, format your code and commit again:

```bash
dotnet format
git add .
git commit
```

## License

MIT