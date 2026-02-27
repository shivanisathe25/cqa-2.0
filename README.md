# Content Quality Analysis 2.0

A comprehensive CQA 2.1 (Content Quality Assessment) skill for auditing Red Hat technical documentation with automated batch processing and full repository support.

> ⚠️ **Before you start:** Have your **product-specific OPL PDF** ready (e.g., `OPL-OpenShift.pdf`, `OPL-RHEL.pdf`). See [Prerequisites](#️-prerequisites) below.

---

## 📦 What's Included

```
cqa-2.0/
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
└── README.md                        # This file
```

---

## ⚠️ Prerequisites

You need to have:

1. **Claude Code** installed and configured
2. **Your product-specific OPL PDF** ready
   - File name format: `OPL-<ProductName>.pdf`
   - Examples: `OPL-OpenShift.pdf`, `OPL-RHEL.pdf`, `OPL-Ansible.pdf`
   - **Where to get it:** Product docs repository, team lead, or Brand/Legal team
   - ⚠️ **CRITICAL:** Required for accurate product name validation (CQA 7.1)

> **Don't have your product OPL?** The installation will work, but product name validation will be incomplete. Get your OPL PDF before running audits.

---

## 🚀 Quick Start

### Installation (3 minutes)

> **Note:** Install CQA 2.0 **once** in a central location, then use it to set up any documentation project.

1. **Clone this repository** (one-time setup):
   ```bash
   cd ~
   git clone https://github.com/shivanisathe25/cqa-2.0.git
   ```

2. **Install into your documentation project:**
   ```bash
   cd ~/cqa-2.0/.claude/skills
   ./install.sh /path/to/your-doc-project
   ```

   This automatically copies the skill and standards to your doc project.

3. **⚠️ ADD your product-specific OPL PDF:**
   ```bash
   cp /path/to/your/OPL-ProductName.pdf /path/to/your-doc-project/standards/
   ```

4. **Verify setup:**
   ```bash
   cd /path/to/your-doc-project
   ./standards/verify-setup.sh
   ```

   Look for: `✅ READY TO RUN AUDITS`

### Usage

Open your documentation project in Claude Code and use natural language:

```
cd /path/to/your-doc-project
claude

# Then in Claude:
Audit all files in .
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

## 📋 Included Files vs Your Files

### Files Included in This Repository

All standard files are included:
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
- **[Slash Command Guide](docs/HOW_TO_MAKE_SLASH_COMMAND.md)** - Advanced: Convert to /command
- **[Required Files](standards/REQUIRED_FILES_README.md)** - Setup requirements

---

## 🎯 Example Workflow

### Scenario: Pre-Migration Assessment

```bash
# 1. Clone CQA 2.0 (one-time setup)
cd ~
git clone https://github.com/shivanisathe25/cqa-2.0.git

# 2. Install into your OpenShift docs project
cd ~/cqa-2.0/.claude/skills
./install.sh ~/openshift-docs

# 3. Add product-specific OPL and verify
cp ~/downloads/OPL-OpenShift.pdf ~/openshift-docs/standards/
cd ~/openshift-docs
./standards/verify-setup.sh

# 4. Open project in Claude Code
claude

# 5. Request audit (natural language)
You: Audit all files in .

# 6. Claude automatically:
#    ✓ Verifies prerequisites
#    ✓ Discovers 106 .adoc files
#    ✓ Groups by assemblies
#    ✓ Processes all files
#    ✓ Generates comprehensive report

# 7. Review report
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
# Update CQA 2.0
cd ~/cqa-2.0
git pull origin main

# Reinstall into your doc project (updates skill + standards)
cd .claude/skills
./install.sh /path/to/your-doc-project
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
- Reinstall: `cd ~/cqa-2.0/.claude/skills && ./install.sh /path/to/your-doc-project`

**"Standards not found"**
- Reinstall: `cd ~/cqa-2.0/.claude/skills && ./install.sh /path/to/your-doc-project`
- The install script automatically copies the standards folder

**"Product name validation incomplete"**
- Add product OPL: `cp OPL-YourProduct.pdf ~/your-project/standards/`
- Verify: `./standards/verify-setup.sh`
