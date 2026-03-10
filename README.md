# github-ready

![Version](https://img.shields.io/badge/version-5.5.1-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Claude Code](https://img.shields.io/badge/Claude_Code-plugin-purple.svg)

> Universal Package Creator & Portfolio Polisher v5.5.1

Create GitHub-ready Python libraries, Claude skills, and Claude Code plugins with badges, CI/CD workflows, coverage metrics, and media artifacts.

## What It Does

**PRIMARY GOAL**: Create **Claude Code Plugins** for packages with hooks, skills, or Claude Code integration.

**SECONDARY GOAL**: Convert existing Python libraries to plugins (brownfield conversion).

**ADVANCED USE CASE**: Create pure Python backend libraries (pip-installable, no hooks/skills) — only when plugin architecture isn't appropriate.

All packages are polished into resume-worthy GitHub artifacts with badges, CI/CD workflows, coverage metrics, and media assets.

## Features

- **Intelligent Detection**: Automatically detects package type and needs
- **Multi-Format Support**: Claude skills, Python libraries, Claude Code plugins
- **Portfolio Polish**: Badges, CI/CD workflows, CHANGELOG, API docs
- **Media Generation**: Banners, architecture diagrams, explainer videos
- **Code Review**: Automated quality validation before portfolio polish
- **Brownfield Conversion**: Convert existing Python libraries to plugins

## Installation

### Three Deployment Models

**IMPORTANT**: This package supports three different deployment modes. Choose the right one for your use case.

#### 1. SKILLS (Dev Deployment) ⭐ **Recommended for Development**

**For**: When you're actively developing this package and want instant feedback.

**Setup:**
```powershell
# Windows (Junction - No admin required)
New-Item -ItemType Junction -Path "P:\.claude\skills\github-ready" -Target "P:\packages\github-ready"

# macOS/Linux (Symlink)
ln -s /path/to/packages/github-ready ~/.claude/skills/github-ready
```

**Key points:**
- ✅ Edit in `P:/packages/github-ready`, changes work immediately
- ✅ No reinstallation required - skills auto-discover from `P:/.claude/skills/`
- ✅ Perfect for active development
- ✅ Junction the entire directory (not individual files)

#### 2. HOOKS (Dev Deployment - Hook Files Only)

**For**: When this package has hook files (`.py` files in `core/hooks/`) you want to test.

**Setup:**
```powershell
# Symlink individual hook files to P:/.claude/hooks/
cd P:/.claude/hooks

# Example: Symlink a specific hook file
cmd /c "mklink HookName.py P:/packages/github-ready/core/hooks/HookName.py"
```

**Key points:**
- ✅ Symlink individual `.py` hook files only (NOT the entire directory)
- ✅ Symlinks go in `P:/.claude/hooks/` (NOT `~/.claude/plugins/`)
- ✅ These are dev-only symlinks for working directly on source code
- ⚠️  After brownfield conversion, check for broken symlinks pointing to old `src/` paths

#### 3. PLUGINS (End User Deployment)

**For**: Distributing this package to other users via marketplace or GitHub.

**Setup:**
```bash
# End users install via /plugin command
/plugin P:/packages/github-ready

# Or from marketplace (when published)
/plugin install github-ready
```

**Key points:**
- ✅ Plugin copied to `~/.claude/plugins/cache/`
- ✅ Registered in `~/.claude/plugins/installed_plugins.json`
- ❌ **NOT for local development** - requires reinstall on every change
- ✅ Use for distributing finished packages to users

### Which Model Should You Use?

| Your Situation | Use This Model | Why |
|----------------|----------------|-----|
| Actively developing this package | **SKILLS** (junction) | Instant feedback, no reinstall |
| Testing hook file changes | **HOOKS** (symlinks) | Direct hook testing |
| Distributing to end users | **PLUGINS** (/plugin) | Proper distribution format |

### Common Mistakes to Avoid

- ❌ Don't use `/plugin` command for local development (requires reinstall on every change)
- ❌ Don't symlink entire directories to `P:/.claude/hooks/` (only symlink `.py` files)
- ❌ Don't confuse skills (`P:/.claude/skills/`) with plugins (`~/.claude/plugins/`)
- ❌ Don't forget to update symlinks after brownfield conversion - check for `src/` paths

## Usage

```bash
# Default: Full intelligent pipeline
/github-ready mylib                   # Detects type, scaffolds, polishes, validates

# Preview mode
/github-ready --dry-run mylib         # Show what will happen

# Skip specific phases
/github-ready mylib --skip media      # Skip NotebookLM media generation
/github-ready mylib --skip badges     # Skip badge generation

# Explicit target
/github-ready --target P:/packages/existing-repo

# Review-only mode
/github-ready --check-only            # Analyze without creating
```

## What Gets Created

### Claude Code Plugins

```
my-plugin/
├── .claude-plugin/          # Plugin metadata
│   └── plugin.json
├── core/                    # Python code
│   ├── __init__.py
│   └── main.py
├── hooks/
│   └── hooks.json           # Hook configuration
├── tests/
├── README.md
└── LICENSE
```

### Python Libraries

```
mylib/
├── src/mylib/
│   └── __init__.py
├── tests/
├── pyproject.toml
├── README.md
└── LICENSE
```

### Claude Skills

```
my-skill/
├── skill/
│   ├── SKILL.md
│   ├── resources/
│   └── scripts/
├── README.md
└── LICENSE
```

## Portfolio Polish

All packages receive:

- **Badges**: Coverage, version, license, CI status (shields.io)
- **CI/CD**: GitHub Actions workflows
- **Documentation**: CHANGELOG.md, CONTRIBUTING.md, API docs
- **Architecture Diagrams**: Mermaid diagrams in README.md
- **Quick Start**: Installation and usage examples

## Development

### Running Tests

```bash
cd P:/packages/github-ready
pytest tests/
```

### Code Quality

```bash
ruff check core/
ruff format core/
```

## License

MIT License - see [LICENSE](LICENSE) for details.

## Contributing

Contributions welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.
