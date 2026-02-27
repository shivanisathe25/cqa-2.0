# Doc Quality Audit Skill v2.0

A comprehensive CQA 2.1 (Content Quality Assessment) skill for auditing Red Hat technical documentation - supports **full repository audits** with automated batch processing.

## Installation

### For Individual Projects

1. Copy `doc-quality-audit.md` to your project's `.claude/skills/` directory:
   ```bash
   mkdir -p .claude/skills
   cp doc-quality-audit.md .claude/skills/
   ```

2. The skill is now available when you use Claude Code in that project directory.

## Usage

The skill supports three modes:

### 1. Full Repository Audit (NEW!)
Audit all .adoc files in an entire repository:

```
Audit all files in /path/to/docs-repo
```

Claude will:
- Discover all .adoc files
- Group by assemblies and their modules
- Process all files systematically
- Generate comprehensive report with aggregate statistics

### 2. Folder Audit
Audit all .adoc files in a specific folder:

```
Audit the files in /path/to/folder
```

### 3. Assembly-Based Audit
Audit an assembly and all its included modules:

```
Audit assembly-file.adoc and all its included modules
```

## What It Checks

- ✅ AsciiDoc compliance (assembly structure, formatting)
- ✅ Modularization (proper use of concept/procedure/reference modules)
- ✅ Templates (compliance with official Red Hat templates)
- ✅ Titles & short descriptions (quality, format, character counts)
- ✅ Prerequisites formatting
- ✅ Grammar and American English
- ✅ Content type correctness
- ✅ Broken links detection
- ✅ Official product names
- ✅ Legal disclaimers for preview features

## Output

Generates a comprehensive assessment report in `assessments/assessment_<repo-name>_<date>.md` with:

### Report Structure
Reports are organized by **Assembly name** followed by detailed assessments:

```markdown
Assembly: creating-container-images
├─ Assembly assessment (compliance, issues)
├─ Module: ob-creating-a-buildah-build.adoc
├─ Module: ob-creating-a-s2i-build.adoc
└─ Module: ob-creating-a-buildpacks-build.adoc

Assembly: managing-builds
├─ Assembly assessment
├─ Module: ob-editing-resources.adoc
└─ Module: ob-deleting-resources.adoc
```

### Includes
- **Executive summary** with aggregate statistics
- **Compliance metrics** (overall % and by category)
- **Critical blockers** requiring fixes
- **Advisory issues** (recommendations)
- **Assembly-based organization** with included modules
- **Character count analysis** with attribute resolution
- **File:line references** for all issues
- **Prioritized action list** with effort estimates
- **Migration readiness checklist**

## Requirements

Requires the following files in your `standards/` folder:
- `CQA-Step-by-Step-Assessment-Guide.md`
- `CQA 2.1 -- Content Quality Assessment_.tsv`
- `modular-docs.md`
- `peer-review-style.md`
- `Modular-documentation-templates-checklist.md`
- `templates/` folder with official AsciiDoc templates
- `common-attributes.adoc`

## Version

CQA 2.1 - February 2026
