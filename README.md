# Doc Quality Audit Skill for Claude Code

A comprehensive CQA 2.1 (Content Quality Assessment) skill for auditing Red Hat technical documentation with automated batch processing and full repository support.

[![Version](https://img.shields.io/badge/version-2.0-blue.svg)](https://github.com/yourusername/doc-quality-audit-skill)
[![License](https://img.shields.io/badge/license-Apache%202.0-green.svg)](LICENSE)

---

## 🎯 Features

- ✅ **Full Repository Audits** - Process 100+ files automatically
- ✅ **Assembly-Based Reports** - Organized by assemblies and their modules
- ✅ **17 CQA 2.1 Checks** - Comprehensive quality assessment
- ✅ **Automatic Verification** - Pre-flight checks for required files
- ✅ **Product-Specific OPL Support** - Validates product names correctly
- ✅ **Natural Language Interface** - No complex commands to remember
- ✅ **Batch Processing** - Progress tracking for large repos
- ✅ **Character Count Resolution** - Automatic attribute expansion

---

## 📦 What's Included

```
doc-quality-audit-skill/
├── .claude/
│   └── skills/
│       ├── doc-quality-audit.md    # Main skill workflow
│       ├── README.md                # Skill documentation
│       └── install.sh               # Installation script
├── standards/
│   ├── CQA-Step-by-Step-Assessment-Guide.md
│   ├── modular-docs.md
│   ├── peer-review-style.md
│   ├── templates/                   # Official AsciiDoc templates
│   ├── OPL.pdf                      # General OPL (278 KB)
│   ├── REQUIRED_FILES_README.md     # Setup documentation
│   └── verify-setup.sh              # Automated verification
├── docs/
│   ├── QUICK_START_GUIDE.md
│   ├── SOLUTION_SUMMARY.md
│   └── HOW_TO_MAKE_SLASH_COMMAND.md
└── README.md                        # This file
```

---

## 🚀 Quick Start

### Installation (5 minutes)

1. **Clone this repository:**
   ```bash
   git clone https://github.com/yourusername/doc-quality-audit-skill.git
   cd doc-quality-audit-skill
   ```

2. **Run installation:**
   ```bash
   cd .claude/skills
   ./install.sh ~/your-doc-project
   ```

3. **Copy standards folder:**
   ```bash
   cd ../..
   cp -r standards ~/your-doc-project/
   ```

4. **⚠️ ADD your product-specific OPL PDF:**
   ```bash
   cp /path/to/your/OPL-ProductName.pdf ~/your-doc-project/standards/
   ```

5. **Verify setup:**
   ```bash
   cd ~/your-doc-project
   ./standards/verify-setup.sh
   ```

   Look for: `✅ READY TO RUN AUDITS`

### Usage

Open your project in Claude Code and use natural language:

```
Audit all files in /path/to/docs-repo
```

**Alternative phrasings:**
- `Assess all documentation in /path/to/docs`
- `Run CQA audit on <folder-name>/`
- `Audit assembly-<assembly-name>.adoc and all its modules`

**Note:** This is NOT a slash command - use plain English!

---

## 📊 What It Audits

### CQA 2.1 Requirements (17 checks)

| Category | Requirements | Details |
|----------|--------------|---------|
| **AsciiDoc** | 1 | Assembly structure, formatting |
| **Modularization** | 5 | Templates, separation, user stories |
| **Titles & Descriptions** | 3 | Quality, format, character counts (50-300) |
| **Procedures** | 1 | Prerequisites formatting |
| **Editorial** | 2 | Grammar, content type correctness |
| **URLs & Links** | 3 | Broken links, redirects, interlinking |
| **Legal & Branding** | 2 | Product names, disclaimers |

### Output

Generates comprehensive report: `assessments/assessment_<repo-name>_<date>.md`

**Includes:**
- Executive summary with compliance metrics
- Assembly-based organization
- File-by-file assessment with ✅/❌ status
- Character count analysis with attribute resolution
- Critical blockers requiring fixes
- Prioritized action list with effort estimates
- Migration readiness checklist

---

## 📋 Prerequisites

### Required Files (Included)

All standard files are included in this repository:
- ✅ CQA 2.1 Assessment Guide
- ✅ Modular documentation reference
- ✅ Peer review style guide
- ✅ Official templates (Assembly, Concept, Procedure, Reference)
- ✅ General OPL PDF (278 KB)
- ✅ Verification script

### Required Files (You Must Add)

Each user must add their **product-specific OPL PDF**:

```bash
# Naming convention: OPL-<ProductName>.pdf
standards/OPL-OpenShift.pdf
standards/OPL-RHEL.pdf
standards/OPL-Ansible.pdf
```

**Why?** Product name validation (CQA 7.1) requires product-specific naming authority.

**Where to get it:** Check your product docs repo, ask your team lead, or contact Brand/Legal.

---

## 🔍 Verification

Before running audits, verify your setup:

```bash
./standards/verify-setup.sh
```

### Possible Outcomes:

✅ **All files present:**
```
✅ READY TO RUN AUDITS
```

⚠️ **Missing product OPL:**
```
⚠ WARNING: No product-specific OPL PDF found
REQUIRED ACTION: Add OPL-<ProductName>.pdf
```

❌ **Missing critical files:**
```
❌ CANNOT RUN AUDITS
Fix the errors listed above
```

---

## 📚 Documentation

- **[Quick Start Guide](docs/QUICK_START_GUIDE.md)** - Get up and running
- **[Solution Summary](docs/SOLUTION_SUMMARY.md)** - Technical details
- **[Slash Command Guide](docs/HOW_TO_MAKE_SLASH_COMMAND.md)** - Advanced: Convert to /command
- **[Required Files](standards/REQUIRED_FILES_README.md)** - Setup requirements

---

## 🎯 Example Workflow

### Scenario: Pre-Migration Assessment

```bash
# 1. Open project in Claude Code
cd ~/openshift-docs
claude

# 2. Request audit (natural language)
You: Audit all files in /home/user/openshift-docs

# 3. Claude automatically:
#    ✓ Verifies prerequisites
#    ✓ Discovers 106 .adoc files
#    ✓ Groups by assemblies
#    ✓ Processes all files
#    ✓ Generates comprehensive report

# 4. Review report
cat assessments/assessment_openshift-docs_2026-02-27.md

# Output shows:
# - Overall compliance: 98% (104/106 files passing)
# - Critical blockers: 2 files
# - Estimated fix effort: 2 hours
# - ✅ READY FOR MIGRATION (after fixes)
```

---

## 🔄 Updates

### Keeping Your Setup Current

```bash
# Update this repo
git pull origin main

# Reinstall skill
cd .claude/skills
./install.sh ~/your-project

# Copy updated standards
cp -r standards ~/your-project/
```

### Update Product OPL

```bash
# Backup old version
mv standards/OPL-YourProduct.pdf standards/OPL-YourProduct-old.pdf

# Add new version
cp /path/to/new/OPL-YourProduct.pdf standards/

# Verify
./standards/verify-setup.sh
```

## Common Issues

**"Skill not found"**
- Verify: `ls -la .claude/skills/doc-quality-audit.md`
- Reinstall: `cd .claude/skills && ./install.sh ~/your-project`

**"Standards not found"**
- Copy standards: `cp -r standards ~/your-project/`

**"Product name validation incomplete"**
- Add product OPL: `cp OPL-YourProduct.pdf ~/your-project/standards/`
- Verify: `./standards/verify-setup.sh`

### Getting Help

1. Review [Quick Start Guide](docs/QUICK_START_GUIDE.md)
2. Review [Required Files README](standards/REQUIRED_FILES_README.md)
3. Run verification: `./standards/verify-setup.sh`
4. [Open an issue](https://github.com/yourusername/doc-quality-audit-skill/issues)
