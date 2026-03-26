---
name: gitready
version: 5.17.0
description: This skill should be used when the user asks to "create a package", "scaffold a Python library", "make a GitHub-ready repo", "generate badges", "set up CI/CD", "convert to plugin", "brownfield conversion", "validate plugin standards", or mentions package scaffolding, portfolio polish, repository structure setup, badge generation, or plugin standards validation. Creates GitHub-ready Python libraries, Claude skills, and Claude Code plugins with badges, CI/CD workflows, coverage metrics, media artifacts, interactive course modules, and automatic plugin standards validation. Now includes PHASE 6: GitHub Publication and PHASE 7: Repository Finalization.
category: scaffolding
triggers:
  - /gitready
aliases:
  - /gitready
workflow_steps:
  - detect_package_type
  - analyze_existing_structure
  - select_package_template
  - validate_plugin_standards
  - scaffold_project_structure
  - configure_ci_cd
  - generate_badges
  - create_documentation
  - validate_package
  - publish_to_github
  - finalize_repository
  - cleanup_obsolete_files

suggest:
  - /init
---
# /gitready — Universal Package Creator & Portfolio Polisher v5.17.0

## Purpose

**PRIMARY GOAL**: Create **Claude Code Plugins** for packages with hooks, skills, or Claude Code integration.

**SECONDARY GOAL**: Convert existing Python libraries to plugins (brownfield conversion).

**ADVANCED USE CASE**: Create pure Python backend libraries (pip-installable, no hooks/skills) — only when plugin architecture isn't appropriate.

All packages are polished into resume-worthy GitHub artifacts with badges, CI/CD workflows, coverage metrics, and media assets.

**v5.3 Update**: Integrated code-review plugin for automated quality validation before portfolio polish. Packages are now reviewed for security, performance, and maintainability issues before adding badges and CI/CD. More efficient workflow: fix quality issues before polishing.

**v5.2 Update**: Aligned with official Claude Code plugin structure. Plugins now follow best practices from hookify, context7, and plugin-dev: minimal plugin.json, scripts/ directory for Python code, hooks/hooks.json, .mcp.json for MCP, and optional commands/agents/skills directories.

**What this does:**
- **Scaffold**: Create canonical Claude Code Plugin structure (.claude-plugin/, scripts/, hooks/) by default
- **Convert**: Transform existing Python libraries to plugins (brownfield conversion)
- **Polish**: Transform repos into GitHub-ready portfolio artifacts (badges, CI/CD, CHANGELOG, metrics)
- **Detect**: Intelligent gap detection identifies what's missing
- **Generate**: Auto-create missing artifacts with evidence-based content

**Advanced**: Create pure Python backend libraries (pyproject.toml, src/, tests/) when plugin architecture isn't appropriate

## Bundled Resources

This skill includes utility scripts and reference documentation:

**Scripts** (`resources/`):
- `badge_generator.py` - Generate badges from shields.io
- `check_standards.py` - Validate package standards compliance
- `standards_compliance.py` - Check Python/Claude skill standards
- `recruiter_checklist.py` - Portfolio optimization checklist

**Templates** (`resources/`):
- `AGENTS.template.md` - AGENTS.md template for AI-maintainable documentation

**Reference Documentation** (`resources/`):
- `BADGE_GENERATION_GUIDE.md` - Complete badge generation guide
- `STANDARDS_VALIDATION.md` - Standards reference
- `V5.2_UPDATE_SUMMARY.md` - v5.1 → v5.2 changes

**Additional References** (`references/`):
- `brownfield-conversion.md` - Python library to plugin conversion
- `plugin-environment.md` - CLAUDE_PLUGIN_ROOT usage guide

## Project Context

### Constitution/Constraints
- Per CLAUDE.md: Solo-dev environment with pragmatic solutions
- **DEFAULT**: Claude Code Plugins for packages with hooks/skills (`.claude-plugin/`, `scripts/`, `hooks/`)
- **MIGRATION**: Convert existing Python libraries to plugins via brownfield conversion
- **ADVANCED**: Pure Python libraries (pyproject.toml, src layout) only for backend code without Claude Code integration
- Windows-compatible links: **Junctions for skill directories** (no admin required, Git-compatible), **Symlinks for individual files** (requires admin or Developer Mode)
  - **CRITICAL**: When using junctions for skill development, add the **junction target** to `.gitignore` to prevent dual git tracking
  - Pattern: Track source (`packages/<name>/skill/`), ignore junction target (`.claude/skills/<name>/`)
  - See: `P:/.claude/arch_decisions/2026-03-16_arch-skill-junction-git-strategy.md`
- Truthfulness required: Only claim what actually exists, don't fabricate features

### Technical Context
- **DEFAULT**: Claude Code Plugins (`.claude-plugin/`, `scripts/`, `hooks/`) for packages with hooks/skills
- **CONVERSION**: Brownfield Python library → Plugin conversion (src/ → scripts/)
- **ADVANCED**: Pure Python libraries (`src/`, `pyproject.toml`) for backend-only code (no hooks/skills)
- Portfolio-quality README with badges, architecture flowchart, Quick Start
- CI/CD workflows with status badges (Python libraries only)
- NotebookLM integration for AI-generated explainer videos and diagrams

### CLAUDE_PLUGIN_ROOT Environment Variable

`CLAUDE_PLUGIN_ROOT` is an environment variable pointing to the plugin's installation directory. Use it in all hook and MCP paths for portability across installation methods (marketplace, local, development).

**See `references/plugin-environment.md`** for complete usage guide.

### Architecture Alignment
- Integrates with `//p-2025` for Python standards
- Works with `/init` for CLAUDE.md initialization

## Your Workflow

**One command → Full intelligent pipeline:**

1. **DETECT** — Scan repository, identify gaps and needs
2. **ANALYZE** — Determine package type automatically
3. **GENERATE** — Create all missing artifacts (structure, badges, CI/CD, docs, CHANGELOG)
4. **VALIDATE** — Verify everything works
5. **CLEANUP** — Detect and remove obsolete files from refactoring
6. **REPORT** — Show what was created with evidence

**No manual phase selection required.** The skill detects what's needed and does it.

**Override flags (rarely needed):**
- `--dry-run` — Preview without creating
- `--skip <phase>` — Skip specific phase (e.g., `--skip media`)
- `--check-only` — Analyze without creating

---

## Philosophy: Intelligent Defaults

**Everything enabled by default.** The skill detects what's needed and walks through all appropriate phases automatically.

```bash
/package                          # Full pipeline: detect → scaffold → polish → validate
/package <name>                   # Same, with specific package name
/package --dry-run                # Preview what will happen
/package --skip <phase>           # Skip specific phase (e.g., --skip media)
```

**What it does automatically:**
1. Detects if new package or existing repo
2. Creates structure if needed
3. Generates all portfolio artifacts (badges, CI/CD, docs, CHANGELOG)
4. Collects metrics and generates badges
5. Validates everything
6. Reports what was done

**Explicit overrides (rarely needed):**
```bash
/package --check-only            # Only review, don't create anything
/package --scaffold-only          # Only create structure, skip polish
/package --target <path>          # Work on specific directory
```

---

## Usage

```bash
# Default: Full intelligent pipeline
/package mylib                   # Detects type, scaffolds, polishes, validates

# Preview mode
/package --dry-run mylib         # Show what will happen

# Skip specific phases
/package mylib --skip media      # Skip NotebookLM media generation
/package mylib --skip badges     # Skip badge generation

# Explicit target (current directory default)
/package --target P:/packages/existing-repo

# Review-only mode
/package --check-only            # Analyze without creating
```

---

## Intent Interpreter

**Simplified interface:** One command does everything. No mode selection required.

| User says | Action |
|-----------|--------|
| `/package` | Run full pipeline on current directory |
| `/package <name>` | Run full pipeline, create new package |
| `/package --dry-run` | Preview what will happen |
| `/package --skip <phase>` | Run full pipeline, skip specific phase |
| `/package --check-only` | Only analyze, don't create anything |

**Target detection:**
- Bare path: `/package P:/packages/mylib` → `--target P:/packages/mylib`
- `for <path>` → `--target <path>`
- Default: current directory

---

## PHASE 0: Dry Run Preview (Optional)

**Objective**: Preview what will be created without writing any files.

**Trigger**: `/package --dry-run [name]` or `/package polish --dry-run`

### What Dry Run Shows

```
=== PACKAGE DRY RUN ===

Mode: create / polish
Target Directory: {{TARGET_DIR}}
Package Name: {{NAME}}

=== Directory Structure ===
{{Tree view of structure}}

=== Files to Create ===
{{List of files with purposes}}

=== Next Steps ===
To proceed, run:
  /package {{NAME}}
```

---

## PHASE 1: Diagnose & Prep (30s)

**Objective**: Clear interference sources before building.

**Prerequisite (auto-runs before any phase that reads bundled resources)**:

```bash
python resources/phases/validate_pointers.py
```
**Purpose**: Validates all bundled-resource pointers resolve to existing, non-empty files. Failures indicate broken bundle links — do not proceed with any phase until this passes. See `resources/phases/validate_pointers.py`.

**Steps:**

0. **Validate bundle pointers** (prerequisite — runs automatically):
```bash
python resources/phases/validate_pointers.py
```
If this fails, stop here and fix the broken pointer(s) before continuing.

1. **Check existing structure**:
```bash
tree {{TARGET_DIR}} -a -L 3 > {{TARGET_DIR}}/pre-pack-tree.txt
```

2. **Clear state files** (prevents state propagation stalls):
```bash
rm -f {{TARGET_DIR}}/.claude/state*.json
rm -f {{TARGET_DIR}}/.claude/checkpoints/*.json
```

3. **Check for existing modules**:
```bash
ls {{TARGET_DIR}}/src/ 2>/dev/null && echo "Modules: YES" || echo "Modules: NO"
```

**Output**: "Prep complete. Modules: [Y/N]. State cleared."

---

## PHASE 1.5: Detect Package Type (30s)

**Objective**: Determine if this is a Claude skill, Python library, Claude Code plugin, Claude Code plugin with MCP server, or hook-based package.

**Detection logic:**

```bash
# Check for SKILL.md (Claude skill marker)
if [ -f "{{TARGET_DIR}}/skill/SKILL.md" ] || [ -f "{{TARGET_DIR}}/SKILL.md" ]; then
    PACKAGE_TYPE="claude-skill"
    echo "Detected: Claude Skill"
# Check for .claude-plugin/ directory (Claude Code plugin with router integration)
elif [ -d "{{TARGET_DIR}}/.claude-plugin" ]; then
    PACKAGE_TYPE="claude-plugin"
    echo "Detected: Claude Code Plugin (with router integration)"

    # Check for MCP server
    if [ -f "{{TARGET_DIR}}/mcp_server.py" ] || [ -f "{{TARGET_DIR}}/mcp/server.py" ] || [ -d "{{TARGET_DIR}}/mcp" ]; then
        HAS_MCP_SERVER=true
        PACKAGE_TYPE="claude-plugin+mcp"
        echo "→ MCP Server: DETECTED"
    else
        HAS_MCP_SERVER=false
        echo "→ MCP Server: NOT FOUND"
    fi
# Check for hook/ directory (hook-based package)
elif [ -d "{{TARGET_DIR}}/hook" ]; then
    PACKAGE_TYPE="hook-package"
    echo "Detected: Hook Package"
# Check for Python library (src/ or pyproject.toml)
elif [ -d "{{TARGET_DIR}}/src" ] || [ -f "{{TARGET_DIR}}/pyproject.toml" ]; then
    PACKAGE_TYPE="python-library"
    echo "Detected: Python Library"

    # BROWNFIELD DETECTION: Check if Python library can be converted to plugin
    if [ -d "{{TARGET_DIR}}/src" ] && [ -f "{{TARGET_DIR}}/pyproject.toml" ]; then
        echo ""
        echo "⚠️  Python library detected: src/{{NAME}}/ with pyproject.toml"
        echo "Convert to Claude Code plugin?"
        echo "  • Removes pip install requirement"
        echo "  • Auto-registers hooks"
        echo "  • Changes: src/ → scripts/, adds plugin.json/hooks.json"
        echo ""
        read -p "Convert to plugin? (y/n): " CONVERT_TO_PLUGIN
        if [ "$CONVERT_TO_PLUGIN" = "y" ]; then
            PACKAGE_TYPE="brownfield-plugin"
            echo "✓ Proceeding with brownfield conversion..."
            echo ""
            echo "Details: This will backup your current structure, migrate src/ to scripts/,"
            echo "remove pyproject.toml, and add plugin configuration files."
            echo "Rollback available if needed."
        else
            echo "→ Keeping as Python library"
        fi
    fi
else
    PACKAGE_TYPE="python-library"
    echo "Detected: Python Library (new)"
fi
```

**Package Types:**

| Type | Trigger | Structure | Use Case | Recommendation |
|------|---------|-----------|----------|----------------|
| `claude-plugin` | `.claude-plugin/` directory exists | `.claude-plugin/` + `scripts/` + `hooks/` + README | **DEFAULT**: Packages with hooks/skills | ✅ **Primary pattern** |
| `claude-plugin+mcp` | `.claude-plugin/` + `mcp_server.py` or `mcp/` | `.claude-plugin/` + `scripts/` + `hooks/` + `.mcp.json` | Plugins with MCP server | ✅ **For MCP integration** |
| `brownfield-plugin` | Python library + user confirms | `src/` → `scripts/` conversion | Convert existing Python lib to plugin | ✅ **Migration path** |
| `python-library` | `src/` or `pyproject.toml` exists (no conversion) | `src/{{NAME}}/` + `tests/` + pyproject.toml | ⚠️ **ADVANCED**: Pure backend code (no hooks/skills) | ⚠️ **Only when plugins inappropriate** |
| `claude-skill` | `SKILL.md` exists | `skill/` only (no `src/`, no pyproject.toml) | Standalone Claude skills | ℹ️ **For skill-only packages** |
| `hook-package` | `hook/` directory exists | `hook/` + README | Legacy hook distribution | ℹ️ **Use plugin pattern instead** |

---

## PHASE 1.6: Brownfield Conversion (2min) — ONLY IF `PACKAGE_TYPE=brownfield-plugin`

⚠️ **CRITICAL**: Review `references/brownfield-conversion.md` FIRST before proceeding.

**Pre-Conversion Checklist** (5 items):
- [ ] Fix hardcoded paths (no `P:/`, `/Users/`, `C:/` in source code)
- [ ] Fix platform-specific code (`.sh` scripts need `.bat` equivalents)
- [ ] Add error handling and logging (no silent `except: pass` blocks)
- [ ] Verify dependencies (use existing libraries, avoid reinventing)
- [ ] Expand test coverage (unit + error paths + integration)

**Summary**: Converts existing Python library (`src/` → `scripts/`) to Claude Code plugin structure with backup, verification, and rollback support. See `references/brownfield-conversion.md` for detailed 7-step workflow.

**Rollback**: Backup created at `.backup/` before conversion. To rollback: `cp -r .backup/* . && rm -rf scripts/ .claude-plugin/`

### Post-Conversion Verification (CRITICAL)

After brownfield conversion, check for broken symlinks that may still point to old `src/` paths:

```bash
# Check for broken symlinks pointing to old src/ path
cd P:/.claude/hooks
ls -la | grep "src/"

# If found, remove and recreate them with correct scripts/ paths:
rm PreCompact_handoff_capture.py SessionStart_handoff_restore.py
cmd /c "mklink PreCompact_handoff_capture.py p:\packages\handoff\scripts\hooks\PreCompact_handoff_capture.py"
cmd /c "mklink SessionStart_handoff_restore.py p:\packages\handoff\scripts\hooks\SessionStart_handoff_restore.py"
```

**Common pitfall**: Symlinks in `P:/.claude/hooks/` may still point to old `src/handoff/hooks/` path after conversion. Must point to `scripts/hooks/`.

## PHASE 1.7: Plugin Standards Validation (Auto-invoked)

> READ: resources/phases/PHASE-1.7-plugin-standards.md

---

## PHASE 2: Build Structure (2min)

**Objective**: Create appropriate directory structure based on package type.

**⚠️ ARCHITECTURE GUIDANCE**:
- **DEFAULT**: Create Claude Code Plugins (`.claude-plugin/`, `scripts/`, `hooks/`) for packages with hooks/skills
- **MIGRATION**: Convert existing Python libraries to plugins via brownfield conversion
- **ADVANCED**: Create pure Python libraries only when plugin architecture isn't appropriate (e.g., pure backend code with no Claude Code integration)

### For Claude Skills (`PACKAGE_TYPE=claude-skill`)

**Standalone Claude Skill structure** (not part of a plugin):

```
{{TARGET_DIR}}/
├── skill/                     # Single source of truth
│   ├── SKILL.md              # Skill definition
│   ├── resources/            # Templates, configs
│   ├── scripts/              # Hook scripts, utility scripts
│   ├── tests/                # Test suite (optional)
│   └── *.py                  # Python modules (if any)
├── README.md
├── LICENSE
└── .gitignore
```

**IMPORTANT**: Claude skills do NOT need `pyproject.toml`. They are distributed as:
- Skills: Via junctions (Windows) or symlinks (macOS/Linux) from `skill/` to `~/.claude/skills/skill-name/`
- Hooks: Referenced in `~/.claude/settings.local.json`
- NOT pip-installable (no `src/`, no Python package)

**Steps:**

1. **Create directory structure**:
```bash
mkdir -p {{TARGET_DIR}}/skill
```

2. **Generate README.md** (see PHASE 3 templates)
3. **Create LICENSE** (MIT by default)
4. **Create scripts/install-dev.bat** (Windows junction automation)

### For Claude Code Plugins (`PACKAGE_TYPE=claude-plugin`)

**Official Claude Code plugin structure following best practices.**

```
{{TARGET_DIR}}/
├── .claude-plugin/            # Plugin metadata
│   └── plugin.json            # Minimal manifest
├── commands/                  # OPTIONAL: Slash commands (.md files)
├── agents/                    # OPTIONAL: Subagents (.md files)
├── skills/                    # OPTIONAL: Auto-activating skills
│   └── skill-name/
│       └── SKILL.md
├── hooks/
│   └── hooks.json             # Hook configuration
├── scripts/                      # Python code
│   ├── __init__.py
│   ├── main.py
│   └── utils/
{% if HAS_MCP_SERVER %}
├── .mcp.json                  # MCP server config
{% endif %}
├── scripts/                   # OPTIONAL: Helper scripts
├── tests/
├── .gitignore
├── README.md
└── LICENSE
```

**IMPORTANT**: Claude Code plugins use auto-discovered components:
- `.claude-plugin/plugin.json` - Minimal manifest (name, description, author)
- Components at ROOT level - commands/, agents/, skills/, hooks/
- `scripts/` directory - Python code (NOT packages/hook/)
{% if HAS_MCP_SERVER %}
- `.mcp.json` - MCP server configuration (NOT mcp/ directory)
{% endif %}
- NO pyproject.toml - Plugins are not pip packages
- CLAUDE_PLUGIN_ROOT - Use for all path references (portability)

**Component directories are OPTIONAL** - only create what you need.

**Steps:**

1. **Create directory structure**:
```bash
mkdir -p {{TARGET_DIR}}/.claude-plugin
mkdir -p {{TARGET_DIR}}/core
mkdir -p {{TARGET_DIR}}/hooks
mkdir -p {{TARGET_DIR}}/tests
# Optional directories (create if needed)
# mkdir -p {{TARGET_DIR}}/commands
# mkdir -p {{TARGET_DIR}}/agents
# mkdir -p {{TARGET_DIR}}/skills
# mkdir -p {{TARGET_DIR}}/scripts
```

2. **Create `.claude-plugin/plugin.json`**:
```json
{
  "name": "{{package_name}}",
  "description": "{{DESCRIPTION}}",
  "author": {
    "name": "{{AUTHOR_NAME}}",
    "email": "{{AUTHOR_EMAIL}}"
  }
}
```

3. **Create `hooks/hooks.json`** (if needed):
```json
{
  "{{HOOK_POINT}}": [{
    "matcher": ".*",
    "hooks": [{
      "type": "command",
      "command": "python CLAUDE_PLUGIN_ROOT/scripts/main.py"
    }]
  }]
}
```

{% if HAS_MCP_SERVER %}
4. **Create `.mcp.json`** (if HAS_MCP_SERVER):
```json
{
  "{{package_name}}": {
    "command": "python",
    "args": ["-m", "scripts.mcp.server"]
  }
}
```
{% endif %}
4. **Create `scripts/__init__.py`**: (Python initialization)
5. **Create `.gitignore`**: (Exclude .local.md files)
6. **Generate README.md** (see PHASE 3 templates)
7. **Create LICENSE** (MIT)

### Local Development Setup

**IMPORTANT: Three different deployment models for Claude Code:**

---

## **1. SKILLS (Dev Deployment)**

**For:** Packages with `skill/SKILL.md` directory

**Setup:**
```powershell
# Windows (Junction - Recommended, no admin required)
New-Item -ItemType Junction -Path "P:\.claude\skills\{{package_name}}" -Target "P:\packages\{{package_name}}\skill"

# macOS/Linux (Symlink)
ln -s /path/to/packages/{{package_name}}/skill ~/.claude/skills/{{package_name}}
```

**Key points:**
- ✅ Junction the entire `skill/` directory
- ✅ Skills auto-discovered from `P:/.claude/skills/`
- ✅ Edit in your package, changes work immediately

---

## **2. HOOKS (Dev Deployment)**

**For:** Packages with hook files (`.py` files in `scripts/hooks/`)

**Setup:**
```powershell
# Symlinks go in P:/.claude/hooks/ (NOT ~/.claude/plugins/)
cd P:/.claude/hooks

# Symlink individual hook files from your package
ln -sf P:/packages/{{package_name}}/scripts/hooks/HookName.py HookName.py
```

**Key points:**
- ✅ Symlink individual `.py` hook files only
- ✅ NOT the entire directory - just the `.py` files
- ✅ Symlinks go in `P:/.claude/hooks/` (NOT `~/.claude/plugins/`)
- ✅ These are dev-only symlinks for working directly on source code
- ✅ Routers or settings.json register the symlinks as actual code

---

## **3. PLUGINS (End User Deployment)**

**For:** Distribution to end users via marketplace or GitHub

**Setup:**
```bash
# End users install via /plugin command
/plugin P:/packages/{{package_name}}

# Or from marketplace
/plugin install {{package_name}}
```

**Key points:**
- ✅ Plugin copied to `~/.claude/plugins/cache/`
- ✅ Registered in `~/.claude/plugins/installed_plugins.json`
- ✅ **NOT for local development** - requires reinstall on every change
- ✅ Use for distributing finished packages to users

---

## **Which Model Does Your Package Need?**

| Package Type | Dev Setup | End User Setup |
|--------------|-----------|----------------|
| **Skill only** | Skill junction | N/A (skill dev = use) |
| **Hooks only** | Hook symlinks | `/plugin` command |
| **Skill + Hooks** | Both | `/plugin` command |
| **Plugin** | Plugin junction to `~/.claude/plugins/local/` | `/plugin` command |

**Common Mistakes:**
- ❌ Don't use `/plugin` command for local development (requires reinstall on every change)
- ❌ Don't symlink entire directories to `P:/claude/hooks/` (only symlink `.py` files)
- ❌ Don't confuse skills (`P:/.claude/skills/`) with plugins (`~/.claude/plugins/`)
- ❌ Don't look for hook symlinks in `~/.claude/plugins/` - they go in `P:/.claude/hooks/`
- ❌ Don't forget to update symlinks after brownfield conversion - check for `src/` paths

### Multiple Skills or Hooks

Some plugins have **multiple skills** or **multiple hook files**. In these cases, you need **one junction per skill** and **one symlink per hook file**.

#### Multiple Skills (One Junction Per Skill)

If your plugin has multiple skills in `skills/`:

```
my-plugin/
├── skills/
│   ├── skill-a/SKILL.md  → Junction 1
│   ├── skill-b/SKILL.md  → Junction 2
│   └── skill-c/SKILL.md  → Junction 3
```

Create **one junction for each skill**:

```powershell
# Example: Plugin with 3 skills
New-Item -ItemType Junction -Path "P:\.claude\skills\skill-a" -Target "P:\packages\my-plugin\skills\skill-a"
New-Item -ItemType Junction -Path "P:\.claude\skills\skill-b" -Target "P:\packages\my-plugin\skills\skill-b"
New-Item -ItemType Junction -Path "P:\.claude\skills\skill-c" -Target "P:\packages\my-plugin\skills\skill-c"
```

**macOS/Linux equivalent:**
```bash
ln -s /path/to/packages/my-plugin/skills/skill-a ~/.claude/skills/skill-a
ln -s /path/to/packages/my-plugin/skills/skill-b ~/.claude/skills/skill-b
ln -s /path/to/packages/my-plugin/skills/skill-c ~/.claude/skills/skill-c
```

#### Multiple Hook Files (One Symlink Per File)

If your plugin has multiple hook files in `scripts/hooks/`:

```
my-plugin/
└── scripts/
    └── hooks/
        ├── hook1.py  → Symlink 1
        ├── hook2.py  → Symlink 2
        └── hook3.py  → Symlink 3
```

Create **one symlink for each hook file**:

```powershell
# Symlinks go in P:/.claude/hooks/ (NOT ~/.claude/plugins/)
cd P:/.claude/hooks

cmd /c "mklink hook1.py P:\packages\my-plugin\scripts\hooks\hook1.py"
cmd /c "mklink hook2.py P:\packages\my-plugin\scripts\hooks\hook2.py"
cmd /c "mklink hook3.py P:\packages\my-plugin\scripts\hooks\hook3.py"
```

**macOS/Linux equivalent:**
```bash
cd ~/.claude/hooks
ln -sf /path/to/packages/my-plugin/scripts/hooks/hook1.py hook1.py
ln -sf /path/to/packages/my-plugin/scripts/hooks/hook2.py hook2.py
ln -sf /path/to/packages/my-plugin/scripts/hooks/hook3.py hook3.py
```

#### Both Skills AND Hooks

If your plugin has **both skills and hooks**, create both junctions and symlinks:

```
my-plugin/
├── skills/
│   ├── skill-a/SKILL.md  → Junction to skills/skill-a/
│   └── skill-b/SKILL.md  → Junction to skills/skill-b/
└── scripts/
    └── hooks/
        ├── hook1.py  → Symlink in P:/.claude/hooks/
        └── hook2.py  → Symlink in P:/.claude/hooks/
```

**Complete setup:**
```powershell
# 1. Create junctions for skills (one per skill)
New-Item -ItemType Junction -Path "P:\.claude\skills\skill-a" -Target "P:\packages\my-plugin\skills\skill-a"
New-Item -ItemType Junction -Path "P:\.claude\skills\skill-b" -Target "P:\packages\my-plugin\skills\skill-b"

# 2. Create symlinks for hook files (one per file)
cd P:/.claude/hooks
cmd /c "mklink hook1.py P:\packages\my-plugin\core\hooks\hook1.py"
cmd /c "mklink hook2.py P:\packages\my-plugin\core\hooks\hook2.py"
```

**Real-world example: gitready package**

The gitready package has:
- 1 skill: `skills/gitready/SKILL.md`
- 0 hooks (no hook files)

Setup:
```powershell
# Just one junction needed
New-Item -ItemType Junction -Path "P:\.claude\skills\package" -Target "P:\packages\gitready\skills\gitready"
```

**Summary table:**

| Plugin has... | Link type | How many? | Where? |
|---------------|-----------|-----------|--------|
| 1 skill | Junction | 1 | `P:/.claude/skills/skill-name` |
| 3 skills | Junctions | 3 (one per skill) | `P:/.claude/skills/skill-a`, `skill-b`, `skill-c` |
| 1 hook file | Symlink | 1 | `P:/.claude/hooks/hook.py` |
| 5 hook files | Symlinks | 5 (one per file) | `P:/.claude/hooks/hook1.py` through `hook5.py` |
| 2 skills + 3 hooks | Both | 2 junctions + 3 symlinks | Skills → `P:/.claude/skills/`, Hooks → `P:/.claude/hooks/` |

### For Python Libraries (`PACKAGE_TYPE=python-library`)

**Steps:**

1. **Create directory structure**:
```bash
mkdir -p {{TARGET_DIR}}/src/{{NAME}}
mkdir -p {{TARGET_DIR}}/tests
touch {{TARGET_DIR}}/src/{{NAME}}/__init__.py
touch {{TARGET_DIR}}/tests/__init__.py
```

2. **Generate README.md** (see PHASE 3 templates)
3. **Create LICENSE** (MIT)
4. **Create pyproject.toml** (full Python package)
5. **Create CONTRIBUTING.md**
6. **Create SECURITY.md**

---

## PHASE 3: Generate Templates

> READ: resources/phases/PHASE-3-templates.md

## PHASE 4: Validate (1min)

**Objective**: Verify package structure is correct.

**Checks:**

1. **Platform compatibility check** (CRITICAL for Claude skills):
```bash
# Detect platform
PLATFORM="$(uname -s)"
case "$PLATFORM" in
  Linux*)     PLATFORM="linux" ;;
  Darwin*)    PLATFORM="macos" ;;
  MINGW*|MSYS*|CYGWIN*) PLATFORM="windows" ;;
  *)          PLATFORM="unknown" ;;
esac

# Check for deployment errors: Platform-specific docs referencing wrong scripts
if [ "$PLATFORM" = "windows" ]; then
  # Check Windows-specific documentation for .sh references in hook configs
  WINDOWS_DOCS=$(find {{TARGET_DIR}} -name "WINDOWS.md" -o -name "INSTALLATION.md" 2>/dev/null)

  if [ -n "$WINDOWS_DOCS" ]; then
    # Look for .sh files referenced in hook/command configurations
    SH_CONFIG_REFS=$(grep -n '"command".*\.sh' $WINDOWS_DOCS 2>/dev/null | grep -v "# " | grep -v "Unix\|Linux\|macOS\|Darwin")

    if [ -n "$SH_CONFIG_REFS" ]; then
      echo "❌ ERROR: Windows documentation references .sh scripts in hook configurations:"
      echo "$SH_CONFIG_REFS"
      echo ""
      echo "Problem: Windows users cannot execute .sh scripts natively without WSL/Git Bash"
      echo "Solution: Change .sh to .bat in hook configuration examples"
      echo ""
      echo "Example fix:"
      echo '  "command": "P:\\\\.claude\\skills\\reflect\\scripts\\hook-stop.sh"'
      echo "  → Should be:"
      echo '  "command": "P:\\\\.claude\\skills\\reflect\\scripts\\hook-stop.bat"'
    fi
  fi

  # Optional: Verify .bat/.ps1 alternatives exist for any .sh files in scripts/
  SH_SCRIPTS=$(find {{TARGET_DIR}} -name "*.sh" -path "*/scripts/*" 2>/dev/null)
  if [ -n "$SH_SCRIPTS" ]; then
    for sh_file in $SH_SCRIPTS; do
      bat_file="${sh_file%.sh}.bat"
      ps1_file="${sh_file%.sh}.ps1"
      if [ ! -f "$bat_file" ] && [ ! -f "$ps1_file" ]; then
        echo "⚠️  WARNING: $sh_file has no .bat or .ps1 equivalent for Windows users"
      fi
    done
  fi
fi
```

2. **Symlink test** (for Claude skills):
```bash
test -L ~/.claude/skills/{{NAME}} && echo "Symlink: OK" || echo "Symlink: MISSING"
```

3. **Pytest collect**:
```bash
pytest --collect-only {{TARGET_DIR}}/tests/
```

4. **Tree diff**:
```bash
tree {{TARGET_DIR}} -a -L 3 > {{TARGET_DIR}}/post-pack-tree.txt
diff {{TARGET_DIR}}/pre-pack-tree.txt {{TARGET_DIR}}/post-pack-tree.txt
```

**Output**: "Validation complete. All checks passed."

---

## PHASE 4.5: Code Review & Meta-Review (Auto-invoked) — UPDATED v5.4

**Objective**: Run automated code review AND meta-review to catch quality and cross-file issues before portfolio polish.

**When**: Automatically runs after PHASE 4 (Validate) completes, before PHASE 5 (Portfolio Polish).

**What this does:**
1. **Code Review Plugin**: Comprehensive code review with confidence-based scoring
   - Checks for security, performance, and maintainability issues
   - Confidence threshold (80+) for filtering findings
   - Generates summary report with actionable recommendations

2. **Meta-Review System**: Cross-file analysis for architectural issues
   - Path traversal vulnerability detection (taint propagation)
   - Import graph analysis (circular dependencies, layering violations)
   - Documentation consistency validation
   - AnalysisUnit-based manifest-driven review

**Execution:**
```python
# Code review (existing)
Skill(skill="code-review:code-review", args="{{TARGET_DIR}}")

# Meta-review (NEW - T-007 integration)
from lib.meta_review.prepare_context import prepare_agent_context
from lib.analysis_unit import create_analysis_unit

unit_id = create_analysis_unit(Path("{{TARGET_DIR}}"))
context = prepare_agent_context(unit_id, perspective="security", max_tokens=8000)

# Run meta-review analyzers
from lib.analysis_unit.analyzers.path_traversal import PathTraversalAnalyzer
from lib.analysis_unit.analyzers.import_graph import ImportGraphAnalyzer
from lib.analysis_unit.analyzers.doc_consistency import DocConsistencyAnalyzer

pt_findings = PathTraversalAnalyzer().analyze(manifest)["findings"]
ig_findings = ImportGraphAnalyzer().analyze(manifest)["findings"]
dc_findings = DocConsistencyAnalyzer(manifest).analyze()

# Combine findings
meta_review_summary = {
    "path_traversal": pt_findings,
    "import_graph": ig_findings,
    "doc_consistency": dc_findings,
    "total_findings": len(pt_findings) + len(ig_findings) + len(dc_findings)
}
```

**Integration notes:**
- Run AFTER structure validation passes
- Run BEFORE portfolio polish (prevents polishing bad code)
- Meta-review is optional (controlled by META_REVIEW_ENABLED env var, default: true)
- If critical findings (HIGH severity): fix before proceeding to PHASE 5
- If advisory findings (MEDIUM/LOW severity): document, proceed to PHASE 5
- If no findings: proceed to PHASE 5

**What gets reviewed:**
- Code review: Package structure, configuration files, Python code
- Meta-review: Cross-file issues, import graphs, path traversals, documentation consistency

**Duration**: 1-3 minutes (combined)

**Output**: Combined code review + meta-review summary with severity-tagged findings

**v5.4 Update**: Integrated meta-review system (T-007) alongside code-review plugin for comprehensive quality validation.

---

## PHASE 4.7: Media Generation (Auto-invoked) — NEW

> READ: resources/phases/PHASE-4.7-media-gen.md

---

## PHASE 4.8: Interactive Course (Auto-invoked)

> READ: resources/phases/PHASE-4.8-interactive-course.md

---

## PHASE 5: Portfolio Polish (Auto-invoked after creation)

**Objective**: Transform package into portfolio-quality GitHub artifact.

**Trigger**: Automatically invoked after PHASE 4 unless `--no-polish` flag is set.

**Workflow**: DETECT → ANALYZE → GENERATE → VALIDATE → REPORT

**Auto-generated artifacts** (if missing):

- **Badges**: Coverage, version, license, CI status (shields.io)
- **CI/CD**: GitHub Actions workflows for testing and deployment
- **Documentation**: CHANGELOG.md, CONTRIBUTING.md, AGENTS.md, API docs from docstrings
- **Architecture flowchart**: GitHub-safe Mermaid flowchart in README.md
- **Video playback page**: `docs/video.html` linked from README for GitHub Pages playback
- **Quick Start**: Installation and usage examples for < 5min setup

**CI/CD Workflow Template** (`.github/workflows/test.yml`):

```yaml
name: Tests

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main, develop ]

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v4

    - name: Set up Python
      uses: actions/setup-python@v5
      with:
        python-version: '3.14'

    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install pytest pytest-cov

    - name: Run tests
      run: |
        pytest tests/ -v --cov=core --cov-report=term
```

**IMPORTANT:**
- ❌ **NO Codecov integration** - Do NOT upload coverage to external services
- ✅ Local coverage reporting only (--cov-report=term)
- ✅ CI badge should show workflow status, not external coverage service

**Checks performed**:
- Platform compatibility (Windows docs vs .sh scripts in hook configs)
- MCP server structure and dependencies
- Security: No secrets in git (.env, *.key, credentials)
- Test coverage reporting and badges

**Output**: Portfolio-ready repository with badges, CI/CD, docs, and examples.

---

## PHASE 6: GitHub Publication (Optional)

**Objective**: Extract package from monorepo (if needed) and create GitHub repository.

**Trigger**: User explicitly requests GitHub publication via `--publish` flag.

**When**: After PHASE 5 (Portfolio Polish) completes, user can optionally publish to GitHub.

**What this does**:

1. **Monorepo Extraction** (if package is in a monorepo):
   - Uses `../../scripts/extract_from_monorepo.py` to create clean git history
   - Two methods: subtree split (preserves history) or fresh init (clean slate)
   - Creates standalone git repository in target directory

2. **GitHub Repository Creation**:
   - Uses `../../scripts/create_github_repo.py` to create repository via GitHub CLI (gh)
   - Sets repository to public
   - Adds remote and pushes code
   - Verifies repository creation

**Scripts**:
- `../../scripts/extract_from_monorepo.py` - Monorepo extraction
- `../../scripts/create_github_repo.py` - GitHub repository creation

**Prerequisites**:
- GitHub CLI (`gh`) installed and authenticated
- Valid GitHub token with repo creation permissions

**Usage**:
```bash
# Publish to GitHub
/gitready my-package --publish

# Or manually after package creation
cd P:/packages/my-package
python ../../scripts/extract_from_monorepo.py . my-package
python ../../scripts/create_github_repo.py my-package . "My awesome package"
```

**Output**: Public GitHub repository with code pushed and ready for use.

---

## PHASE 7: Repository Finalization (Optional)

**Objective**: Automate post-publish tasks that happen immediately after repo creation.

**Trigger**: User explicitly requests finalization via `--finalize` flag.

**When**: After PHASE 6 (GitHub Publication) completes.

**What this does**:

1. **GitHub Pages Enablement**:
   - Automatically enables GitHub Pages for documentation
   - Sets correct branch/directory (root or /docs)
   - Provides Pages URL for verification

2. **Initial Release Creation**:
   - Creates v0.1.0 or v1.0.0 release via `gh release create`
   - Generates release notes from CHANGELOG.md
   - Provides release URL for verification

3. **Repository Topics/Tags**:
   - Adds relevant topics based on package type (python, claude-code, plugin, mcp, etc.)
   - Improves repository discoverability

4. **CODEOWNERS File**:
   - Generates CODEOWNERS file from git config or provided username
   - Essential for collaborative projects

5. **SECURITY.md File**:
   - Generates security policy template
   - Includes vulnerability reporting instructions

**Script**: `../../scripts/finalize_github_repo.py`

**Usage**:
```bash
# Finalize after GitHub publication
/gitready my-package --publish --finalize

# Or manually after repo creation
cd P:/packages/my-package
python ../../scripts/finalize_github_repo.py my-package . --package-type plugin
```

**Options**:
- `--package-type` - Type of package (plugin, skill, mcp, library, tool)
- `--release-version` - Version for initial release (default: 0.1.0)
- `--username` - GitHub username for CODEOWNERS
- `--skip-pages` - Skip GitHub Pages enablement
- `--skip-release` - Skip initial release creation
- `--skip-topics` - Skip adding repository topics
- `--skip-codeowners` - Skip CODEOWNERS file generation
- `--skip-security` - Skip SECURITY.md generation

**Output**: Fully finalized GitHub repository with Pages enabled, initial release created, topics added, and governance files in place.

---

## PHASE 4.6: Quality Scanning (Optional, during validation)

**Objective**: Automated security and dependency scanning during validation phase.

**Trigger**: User explicitly requests quality scan via `--scan-quality` flag.

**When**: During PHASE 4 (Validate) or as standalone check.

**What this does**:

1. **Security Scanning**:
   - Runs `bandit` for Python security issues
   - Runs `safety` for known vulnerable dependencies
   - Reports issues by severity (HIGH, MEDIUM, LOW)

2. **Dependency Auditing**:
   - Runs `pip-audit` for vulnerability scanning
   - Checks for outdated packages
   - Reports affected versions

3. **Badge Validation**:
   - Verifies all badge URLs in README.md are reachable
   - Checks CI/CD badges reference correct workflows
   - Warns about broken badges

4. **Quality Metrics**:
   - Counts Python files and test files
   - Calculates test ratio
   - Reports total lines of code

**Script**: `../../scripts/scan_package_quality.py`

**Usage**:
```bash
# Scan during package creation
/gitready my-package --scan-quality

# Or as standalone check
python ../../scripts/scan_package_quality.py P:/packages/my-package

# With options
python ../../scripts/scan_package_quality.py . --skip-badges --save-report
```

**Options**:
- `--skip-security` - Skip security scanning (bandit, safety)
- `--skip-audit` - Skip dependency auditing (pip-audit)
- `--skip-badges` - Skip badge validation
- `--skip-quality` - Skip code quality metrics
- `--save-report` - Save scan results to .quality-report.json
- `--fail-on-issues` - Exit with error code if issues are found

**Output**: Quality scan report with security issues, vulnerabilities, badge problems, and quality metrics.

---

## PHASE 8: Cleanup (Auto-invoked)

**Objective**: Detect and remove obsolete files after refactoring/scaffolding.

**When**: Automatically runs after PHASE 5 (Portfolio Polish) completes.

**What this detects**:
- **Backup files** (`*.backup-*`, `*.old`, `*.bak`) - Shows file size and removal command
- **Orphaned test files** - Tests for modules that no longer exist
- **Obsolete documentation** - Old CHANGELOGs, phase completion docs, verification docs
- **Duplicate implementations** - Known refactoring patterns (e.g., `skill_enforcement` → `skill_first_gate`)

**Output**: `CLEANUP_REPORT.md` with:
- Categorized list of files to remove
- Evidence for why each should be removed
- Bulk removal commands ready to run
- Commit message template

**Usage**: Review report and manually remove files (recommended for first run).

---

## PHASE 9: Git Ready (Auto-invoked)

**Objective**: Initialize git repository and create initial commit.

**When**: Automatically runs after PHASE 4 (Validate) completes.

**What this does**:
- Initialize git repository (if not already a git repo): `git init`
- Add all files and create initial commit: `git commit -m "Initial commit: Package scaffold..."`
- Set main branch: `git branch -M main`
- Skips if `.git/` directory already exists

**Manual steps** (user does when ready):
- Add remote: `git remote add origin https://github.com/{{USERNAME}}/{{NAME}}.git`
- Push to GitHub: `git push -u origin main`

---

## PHASE 10: Recruiter Readiness Validation (Auto-invoked)

**Objective**: Validate package is showcase-ready for recruiters before GitHub posting.

**When**: Automatically runs after PHASE 5 (Portfolio Polish) completes.

**Checks performed**:
- TODO comments in `pyproject.toml` (suggests incomplete work)
- Plan files in root (looks messy/unprofessional)
- Missing CI/CD workflow (reduces perceived professionalism)
- No tests directory (lack of quality evidence)
- Version is `0.0.x` or `0.1.x` (suggests experimental/unstable)

**Scoring**: 90-100 (Excellent), 70-89 (Good), 50-69 (Fair), <50 (Poor)

**Auto-fixes available**: Remove TODOs, move plan files to `docs/planning/`, create CI/CD workflow, bump version to `0.5.0` or `1.0.0`.

**Output**: `RECRUITER_READINESS_REPORT.md` with score, issues found, and one-command fixes.

## Integration

**Related skills:**
- `/init` - Initialize CLAUDE.md for new projects

**Deprecated skills:**
- `/media-pipeline` - Functionality merged into `/package` as PHASE 4.7 (Media Generation)

**Used by:**
- **PRIMARY**: Claude Code Plugins (hooks, skills, MCP integration)
- **MIGRATION**: Python libraries being converted to plugins
- **ADVANCED**: Pure Python backend libraries (no Claude Code integration)

---

## COMPLETION REPORT (Always Show at End)

**MANDATORY**: After ALL phases complete, show GitHub readiness status.

### What to Check

```bash
# 1. Check if GitHub remote exists
git remote -v | grep github.com

# 2. Check if repo is public (requires gh CLI)
gh repo view --json name,owner,isPublic,url

# 3. Verify portfolio polish completeness
checklist=(
  "README.md with badges"
  "CHANGELOG.md"
  "CONTRIBUTING.md"
  "AGENTS.md"
  ".github/workflows/test.yml"
  "LICENSE file"
  "tests/ directory exists"
  "pytest tests pass"
  "pyproject.toml or setup.py"
  "Media assets generated (if applicable)"
)
```

### Output Format

**MUST show one of these statuses:**

#### ✅ STATUS: PUBLIC ON GITHUB
```
🎉 Package is LIVE and PUBLIC on GitHub!

🔗 https://github.com/EndUser123/package-name

✅ Portfolio polish: COMPLETE
✅ All tests: PASSING
✅ CI/CD: CONFIGURED
✅ Documentation: COMPLETE
✅ Media assets: GENERATED
✅ Ready for: recruiters, portfolio, public use
```

#### ⚠️ STATUS: READY FOR GITHUB (NOT YET PUBLIC)
```
✅ Package is POLISHED and ready for GitHub!

📋 Ready to publish:
- All badges, CI/CD, docs complete
- Tests passing, coverage configured
- Media assets generated
- CHANGELOG and CONTRIBUTING docs ready

⚠️ Next steps:
1. Create GitHub repo: gh repo create package-name --public --source=. --push
2. Or manually: git remote add origin https://github.com/USER/REPO.git && git push -u origin main

🔗 After pushing: https://github.com/YOUR_USERNAME/package-name
```

#### 🔄 STATUS: LOCAL ONLY (NEEDS POLISH)
```
📦 Package exists locally

⚠️ Not yet ready for GitHub:
- [ ] Complete portfolio polish (PHASE 5)
- [ ] Generate media assets (PHASE 4.7)
- [ ] Ensure all tests pass
- [ ] Review Recruiter Readiness Report

💡 Run: /gitready <package-path> --polish
```

## Changelog

### v5.16.0 (2026-03-25)
- ✅ **4-PASS COURSE PIPELINE**: PHASE 4.8 now generates courses in 4 progressive passes (Structure → Visual Design → Interactive Elements → Polish), each adding a quality layer
- ✅ **FULL CODEBASE-TO-COURSE RESOURCES**: `resources/codebase-to-course/design-system.md` (403 lines) and `interactive-elements.md` (1045 lines) copied into skill — all 17 interactive element patterns now available inline
- ✅ **COMPLETE DESIGN TOKENS**: All 30+ tokens from codebase-to-course inlined (semantic colors, actor colors, spacing scale, shadow depth, animation easing, type scale)
- ✅ **REQUIRED READING PATTERN**: PHASE 4.8 explicitly instructs reading bundled resources before each pass — no more "suggested reference" that gets skipped
- ✅ **GLOSSARY TOOLTIP SYSTEM**: Full tooltip JS with `position: fixed`, body-append, flip-on-overflow, hover + tap support
- ✅ **ALL INTERACTIVE ELEMENTS**: Quizzes, drag-and-drop matching, group chat animation, data flow animation, architecture diagram, layer toggle, spot-the-bug, scenario quiz
- ✅ **PER-FILE BUG CHECKLISTS**: Each pass has its own checklist, ensuring issues are caught at the right layer

### v5.17.0 (2026-03-25)
- ✅ **P3 STRUCTURAL CONSOLIDATION**: Extracted 4 largest phases to `resources/phases/` for progressive disclosure
  - PHASE 1.7 → `resources/phases/PHASE-1.7-plugin-standards.md` (177 lines)
  - PHASE 3 → `resources/phases/PHASE-3-templates.md` (479 lines)
  - PHASE 4.7 → `resources/phases/PHASE-4.7-media-gen.md` (823 lines)
  - PHASE 4.8 → `resources/phases/PHASE-4.8-interactive-course.md` (147 lines)
- ✅ **SKILL.md REDUCED**: 3,012 lines → 1,407 lines (53% reduction)
- ✅ **FIXED PHASE ORDERING**: PHASE 4.6 now follows PHASE 4.5 (not PHASE 7)
- ✅ **FIXED MERGED HEADERS**: PHASE 1.6 warning block split, PHASE 8/9/10 blob split

### v5.15.0 (2026-03-24)
- ✅ **INLINE COURSE GENERATION**: PHASE 4.8 no longer delegates to /codebase-to-course — course generation is now inline
- ✅ **WARM PALETTE INTEGRATION**: Course HTML uses PHASE 3 warm palette CSS (no purple gradients)
- ✅ **DESIGN TOKENS INLINED**: Typography (Bricolage Grotesque, DM Sans, JetBrains Mono), Catppuccin syntax highlighting, accessibility features all referenced from PHASE 3
- ✅ **4-STEP EXECUTION**: Renamed curriculum steps from "Phase X:" to "Step X:" to avoid collision with skill workflow "PHASE" headers
- ✅ **BUG PREVENTION CHECKLIST**: Pre-declaration verification for CSS variables, prefers-color-scheme, prefers-reduced-motion, ARIA, tooltips
- ✅ **THEME TOGGLE FIX**: PHASE 3 HTML template now uses localStorage-first check with system prefers-color-scheme fallback and mid-session change listener (dark-mode users no longer see light flash on first visit)

### v5.14.0 (2026-03-24)
- ✅ **INTERACTIVE COURSE (PHASE 4.8)**: Invokes codebase-to-course skill to generate standalone HTML course
- ✅ **SELF-CONTAINED HTML**: Course output to `docs/{package}_course.html` with scroll navigation, animations, quizzes
- ✅ **CODE↔ENGLISH TRANSLATIONS**: Side-by-side code explanations for non-technical learners
- ✅ **GITHUB PAGES INTEGRATION**: Course linked from README "Additional Media Assets" section
- ✅ **VISUAL-FIRST DESIGN**: Tooltips, metaphors, "aha!" callouts, interactive quizzes

### v5.6.0 (2026-03-14)
- ✅ **PLUGIN STANDARDS VALIDATION**: Added PHASE 1.7 - automatic validation of plugin files/folders against Claude Code plugin standards
- ✅ **CRUD RECOMMENDATIONS**: Auto-detects non-standard files and provides Create/Update/Delete recommendations
- ✅ **MULTI-PLUGIN VALIDATION**: Standards validated against multiple production plugins (handoff, search-research, gitready)
- ✅ **AUTO-CLEANUP**: One-command cleanup script for removing/moving non-standard files
- ✅ **FORBIDDEN FILE DETECTION**: Identifies `pyproject.toml`, `src/`, `setup.py` violations in plugins
- ✅ **TEMPORARY FILE DETECTION**: Finds test scripts, diagnostic artifacts, temporary documentation
- ✅ **COMPLIANCE SCORING**: Generates compliance scores (0-100) with detailed violation reports
- ✅ **WORKFLOW INTEGRATION**: Added `validate_plugin_standards` to workflow_steps
- ✅ **STANDARDS SOURCE**: Validated against official Claude Code plugin documentation + 3 production plugins

### v5.5.5 (2026-03-10)
- ✅ **GITHUB-COMPATIBLE MEDIA**: Fixed README media template for GitHub compatibility
- ✅ Replaced inline README video attempts with GitHub-safe links
- ✅ Removed broken PDF thumbnail images - use clean markdown links instead
- ✅ Added shields.io badges for visual appeal (🎬 Watch Video, 🎙️ Listen Now)
- ✅ Simplified PDF links - open in GitHub's built-in PDF viewer
- ✅ Documentation updated: "No HTML tags in README - GitHub markdown is safer"

### v5.5.4 (2026-03-10)
- ✅ **MEDIA ASSETS TEMPLATE**: Added Media Assets section template to PHASE 3 README generation
- ✅ Early media template for browser playback experiments
- ✅ Center-aligned media with proper markdown image embedding
- ✅ Download links and direct links for all assets
- ✅ Improved media visibility on GitHub with direct links and better structure
- ✅ Images embedded directly, PDFs with GitHub viewer integration

### v5.5.6 (2026-03-11)
- ✅ **GITHUB PAGES VIDEO PLAYBACK**: README now links preview GIFs to `docs/video.html` on GitHub Pages
- ✅ README architecture section now defaults to GitHub-safe Mermaid flowcharts instead of C4 blocks
- ✅ Media guidance updated to treat direct MP4 links as fallback, not the primary playback path
- ✅ Skill instructions aligned with the working `github.io` player-page workflow

### v5.5.3 (2026-03-10)
- ✅ **COMPLETION REPORT**: Added GitHub readiness status check at end of workflow
- ✅ Always shows if package is public on GitHub.com
- ✅ Indicates if package is ready for GitHub (perfect polish)
- ✅ Shows what's missing if not yet ready
- ✅ Three clear statuses: PUBLIC, READY FOR GITHUB, LOCAL ONLY

### v5.5.2 (2026-03-10)
- ✅ **CI/CD TEMPLATE**: Added explicit GitHub Actions workflow template to PHASE 5
- ✅ **NO CODECOV**: Clarified that CI workflows should NOT upload to external coverage services
- ✅ Coverage reporting: Local terminal output only (--cov-report=term)
- ✅ Prevents confusion about Codecov integration - no external service uploads

### v5.5.1 (2026-03-10)
- ✅ **DOCUMENTATION**: Added comprehensive "Three Deployment Models" template to PHASE 3
- ✅ README templates now include SKILLS/HOOKS/PLUGINS deployment comparison table
- ✅ Added "Common Mistakes to Avoid" section preventing deployment confusion
- ✅ Added "Which Model Should You Use?" decision guide for developers
- ✅ Auto-generated READMEs now prevent dev mode setup confusion
- ✅ No more manual explanation needed - skill creates complete deployment docs

### v5.4.3 (2026-03-10)
- ✅ **DOCUMENTATION**: Added comprehensive usage examples for NotebookLM cleanup
- ✅ Added step-by-step example session showing typical cleanup workflow
- ✅ Added troubleshooting section with 4 common issues and solutions
- ✅ Documented edge cases: empty NOTEBOOK_ID, pattern mismatches, multiple matches, permission errors
- ✅ Improved user onboarding with realistic command examples
- ✅ Operational verification tests passed - all safety features validated

### v5.4.2 (2026-03-10)
- ✅ **SECURITY FIX**: Added defensive error handling to NotebookLM cleanup
- ✅ Confirmation prompt required before deletion (prevents accidental data loss)
- ✅ Error detection and reporting for failed deletion attempts
- ✅ Dry-run mode shows what will be deleted before asking confirmation
- ✅ Safety warnings about permanent deletion and verification steps
- ✅ Fixed risk: Overly broad grep pattern now has explicit confirmation
- ✅ Fixed risk: Silent failures now detected and reported
- ✅ Pre-mortem validated approach through operational verification

### v5.4.1 (2026-03-10)
- ✅ **UPDATED**: NotebookLM temporary notebooks now use clear naming pattern
- ✅ Temp notebooks named: "TEMP: {package} Media Generation [timestamp]"
- ✅ Added notebook cleanup instructions after asset generation
- ✅ Prevents clutter in NotebookLM library with clearly identifiable temporary notebooks
- ✅ Safe cleanup pattern ensures only temp notebooks are deleted

### v5.4.0 (2026-03-09)
- ✅ **MERGED**: /media-pipeline integrated as PHASE 4.7 (Media Generation)
- ✅ Auto-generates professional portfolio assets (banners, diagrams, videos)
- ✅ NotebookLM integration for architecture diagrams and explainer videos
- ✅ Initial explainer video structure for AI narrated overviews (later refined toward a shorter technical style)
- ✅ Vision API verification for asset quality before acceptance
- ✅ Provider detection (NotebookLM, OpenRouter) with clear setup instructions
- ✅ Auto-skip for internal tools (python-library type) or when providers missing
- ✅ `--skip media` flag for fast iterations without visual asset generation
- ✅ **DEPRECATED**: Standalone /media-pipeline skill (functionality moved to /package)
- ✅ Unified workflow: one command creates structure, validates code, generates media, polishes portfolio

### v5.5.0 (2026-03-10)
- ✅ Integrated meta-review system into PHASE 4.5 (T-007)
- ✅ Added cross-file analysis: path_traversal, import_graph, doc_consistency
- ✅ Combined code-review plugin + meta-review for comprehensive validation
- ✅ AnalysisUnit-based manifest-driven review workflow
- ✅ Optional meta-review via META_REVIEW_ENABLED env var (default: true)
- ✅ See test_meta_review_integration.py for full integration tests
- ✅ No breaking changes to existing workflows

### v5.3.0 (2026-03-07)
- ✅ Added PHASE 4.5: Code Review (code-review plugin integration)
- ✅ Automated quality validation before portfolio polish
- ✅ Confidence-based scoring (80+ threshold) for findings
- ✅ Reviews package structure, configuration, and code
- ✅ Prevents polishing code with quality issues
- ✅ More efficient workflow: fix before polishing
- ✅ See skill_review_comprehensive_analysis.md for full integration details

### v5.2.0 (2025-03-07)
- ✅ Updated to Claude Code plugin best practices (v5.2 structure)
- ✅ Added `core/` directory for Python code
- ✅ Added `hooks/hooks.json` for hook configuration
- ✅ Added `.mcp.json` for MCP server configuration
- ✅ Removed `pyproject.toml` (plugins don't need pip packaging)
- ✅ Added local development setup (junctions/symlinks)
- ✅ Added brownfield conversion workflow (src/ → core/)
- ✅ Enhanced progressive disclosure with references/
- ✅ Reduced word count from 10,996 to ~4,000 words
- ✅ Added Bundled Resources documentation
- ✅ Fixed integration verification (removed //p-2025)
- ✅ Simplified PHASE sections with concise references

### v5.1.0
- Initial router-based hook package support
- MCP server directory structure
- pyproject.toml packaging

### v5.0.0
- Python library scaffolding
- Claude skill creation
- Badge generation
- CI/CD workflows
