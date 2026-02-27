# Doc Quality Audit Skill - Complete User Experience Demo

## Quick Start: How to Run the Audit

**It's simple - just use natural language!** No special commands needed.

### In Claude Code, just say:

**Full Repository Audit:**
```
Audit all files in /home/user/docs-repo
```

**Folder Audit:**
```
Audit the files in configuring/
```

**Assembly + Modules:**
```
Audit assembly-monitoring.adoc and all its modules
```

### Why No Slash Command?

This is **NOT** a `/command` - it's a workflow that I (Claude) follow automatically when you ask for an audit in natural language.

✅ **Simpler** - No special syntax to remember
✅ **Flexible** - Works with any phrasing
✅ **Natural** - Just describe what you want

---

## Full Demo: Jane from OpenShift Docs Team

Jane just received the doc-quality-audit skill package and wants to audit her OpenShift documentation.

---

## Step 1: Extract the Package

```bash
$ cd ~/Downloads
$ tar -xzf doc-quality-audit-skill-v2-complete.tar.gz

$ ls -la
total 256
drwxr-xr-x  jane  staff   .claude/
drwxr-xr-x  jane  staff   standards/
-rw-r--r--  jane  staff   SHARING_INSTRUCTIONS.md
-rw-r--r--  jane  staff   TEAM_DISTRIBUTION_SUMMARY_v2.md
-rw-r--r--  jane  staff   QUICK_START_GUIDE.md

$ ls .claude/skills/
doc-quality-audit.md
README.md
install.sh
```

✅ Package extracted successfully

---

## Step 2: Run the Install Script

```bash
$ cd .claude/skills
$ ./install.sh ~/openshift-docs-project

🔧 Installing doc-quality-audit skill...
📁 Installing to project directory: /home/jane/openshift-docs-project/.claude/skills

✅ Installed doc-quality-audit.md to /home/jane/openshift-docs-project/.claude/skills/

✅ Installation complete!

⚠️  IMPORTANT: Required Setup Steps
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. Copy standards folder to your project:
   cp -r standards/ /home/jane/openshift-docs-project/

2. ADD your product-specific OPL PDF:
   cp /path/to/your/OPL-ProductName.pdf /home/jane/openshift-docs-project/standards/

   Examples:
   - OPL-OpenShift.pdf
   - OPL-RHEL.pdf
   - OPL-Ansible.pdf

   ⚠️  This is REQUIRED for accurate product name validation!

3. Verify setup:
   cd /home/jane/openshift-docs-project
   ./standards/verify-setup.sh

📖 Usage (after setup):
   Audit all files in /path/to/docs-repo
```

✅ Skill installed

---

## Step 3: Copy Standards Folder

```bash
$ cd ~/Downloads
$ cp -r standards ~/openshift-docs-project/

$ ls ~/openshift-docs-project/standards/
CQA-Step-by-Step-Assessment-Guide.md
CQA 2.1 -- Content Quality Assessment_.tsv
modular-docs.md
peer-review-style.md
Modular-documentation-templates-checklist.md
common-attributes.adoc
OPL.pdf                                    ← General OPL (included)
REQUIRED_FILES_README.md
verify-setup.sh
templates/
```

✅ Standards folder copied

---

## Step 4: First Verification Attempt (Missing Product OPL)

```bash
$ cd ~/openshift-docs-project
$ ./standards/verify-setup.sh

╔════════════════════════════════════════════════════════════╗
║   Doc Quality Audit - Setup Verification                  ║
╚════════════════════════════════════════════════════════════╝

Checking Required Standard Files...
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✓ CQA Step-by-Step Guide
✓ CQA 2.1 Assessment Matrix
✓ Modular Documentation Reference
✓ Peer Review Style Guide
✓ Templates Checklist
✓ Common Attributes File
✓ Required Files Documentation

Checking Templates Folder...
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✓ Templates folder exists
✓   Assembly Template
✓   Concept Template
✓   Procedure Template
✓   Reference Template

Checking Product Naming References...
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✓ General OPL PDF (OPL.pdf)
⚠ WARNING: No product-specific OPL PDF found
  Expected naming: OPL-<product-name>.pdf
  Example: OPL-OpenShift.pdf, OPL-RHEL.pdf

  REQUIRED ACTION:
  1. Obtain your product's Official Product List (OPL) PDF
  2. Save it as: /home/jane/openshift-docs-project/standards/OPL-<product-name>.pdf
  3. Re-run this verification script

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Summary
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠ Setup complete with 1 warning(s)

You can run audits, but consider addressing the warnings above.

IMPORTANT: Product name validation may not be accurate without
           a product-specific OPL PDF.
```

⚠️ Warning: Product-specific OPL needed

---

## Step 5: Jane Adds Her Product-Specific OPL

```bash
$ # Jane gets her OpenShift OPL PDF from the doc repo
$ cp ~/Downloads/OPL-OpenShift.pdf ~/openshift-docs-project/standards/

$ ls ~/openshift-docs-project/standards/*.pdf
OPL.pdf              ← General OPL
OPL-OpenShift.pdf    ← Product-specific OPL (Jane's)
```

✅ Product OPL added

---

## Step 6: Second Verification (Success!)

```bash
$ ./standards/verify-setup.sh

╔════════════════════════════════════════════════════════════╗
║   Doc Quality Audit - Setup Verification                  ║
╚════════════════════════════════════════════════════════════╝

Checking Required Standard Files...
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✓ CQA Step-by-Step Guide
✓ CQA 2.1 Assessment Matrix
✓ Modular Documentation Reference
✓ Peer Review Style Guide
✓ Templates Checklist
✓ Common Attributes File
✓ Required Files Documentation

Checking Templates Folder...
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✓ Templates folder exists
✓   Assembly Template
✓   Concept Template
✓   Procedure Template
✓   Reference Template

Checking Product Naming References...
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✓ General OPL PDF (OPL.pdf)
✓ Product-specific OPL PDF(s) found (1):
  - OPL-OpenShift.pdf

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Summary
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✓ All required files present!

✅ READY TO RUN AUDITS

Usage:
  Audit all files in /path/to/docs-repo
  Audit the files in folder/
  Audit assembly-file.adoc and all its modules
```

✅ Setup complete! Ready to audit!

---

## Step 7: Jane Opens Her Project in Claude Code

```bash
$ cd ~/openshift-docs-project
$ claude
```

```
Claude Code v4.6
Project: /home/jane/openshift-docs-project

Ready. How can I help?
```

---

## Step 8: Jane Requests an Audit

**Jane types (in natural language - no special command needed):**
```
Audit all files in /home/jane/Doc Repos/openshift-docs
```

**Alternative phrasings that also work:**
```
Assess all documentation in /home/jane/Doc Repos/openshift-docs
Run CQA audit on /home/jane/Doc Repos/openshift-docs
Check documentation quality in /home/jane/Doc Repos/openshift-docs
```

**Note:** This is NOT a slash command like `/commit`. Just describe what you want in plain English!

---

## Step 9: Claude Performs Prerequisite Check (Phase 0)

**Claude responds:**

```
I'll audit all the OpenShift documentation files. Let me start by
verifying the prerequisites...

🔍 Phase 0: Prerequisites Verification
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Checking required files in standards/ folder...
```

**Claude runs checks:**
```bash
# Checking core standards files
ls standards/CQA-Step-by-Step-Assessment-Guide.md ✓
ls standards/modular-docs.md ✓
ls standards/peer-review-style.md ✓
ls standards/templates/*.adoc ✓
ls standards/common-attributes.adoc ✓

# Checking for OPL PDFs
ls standards/*.pdf
  - OPL.pdf ✓ (General OPL)
  - OPL-OpenShift.pdf ✓ (Product-specific)
```

**Claude reports:**

```
✅ Prerequisites Check Passed

Found:
  ✓ All core CQA 2.1 standards files
  ✓ Complete templates folder (4 templates)
  ✓ Common attributes file
  ✓ General OPL PDF (OPL.pdf)
  ✓ Product-specific OPL PDF (OPL-OpenShift.pdf)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Step 10: Discovery Phase Begins

**Claude continues:**

```
🔍 Phase 1: Discovery & Planning
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Discovering documentation files...
```

**Claude runs:**
```bash
find "/home/jane/Doc Repos/openshift-docs" -name "*.adoc" -type f
```

**Claude reports:**

```
📊 Discovery Results:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Total files found: 106 .adoc files

File types discovered:
  - Assemblies: 12 files
  - Procedure modules: 48 files
  - Concept modules: 23 files
  - Reference modules: 18 files
  - Other/Snippets: 5 files

Main directories:
  - about/ (8 files)
  - installing/ (12 files)
  - configuring/ (18 files)
  - work_with_builds/ (15 files)
  - modules/ (48 files)
  - observability/ (5 files)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Step 11: Reading Standards Files

**Claude continues:**

```
📚 Reading CQA 2.1 Standards & Templates
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Loading assessment criteria...
  ✓ CQA-Step-by-Step-Assessment-Guide.md (779 lines)
  ✓ modular-docs.md (Modular documentation reference)
  ✓ peer-review-style.md (Editorial guidelines)

Loading templates for comparison...
  ✓ TEMPLATE_ASSEMBLY_a-collection-of-modules.adoc
  ✓ TEMPLATE_CONCEPT_concept-explanation.adoc
  ✓ TEMPLATE_PROCEDURE_doing-one-procedure.adoc
  ✓ TEMPLATE_REFERENCE_reference-material.adoc

Loading attribute definitions...
  ✓ common-attributes.adoc (For character count resolution)
  ✓ _attributes/common-attributes.adoc (Repository-specific)

Attributes found for resolution:
  - {product-title} → "OpenShift Container Platform"
  - {builds-shortname} → "Builds"
  - {builds-title} → "builds for Red Hat OpenShift"
  - {ocp-product-title} → "OpenShift Container Platform"
  ... (26 attributes total)

Loading product naming references...
  ✓ OPL.pdf (General product list)
  ✓ OPL-OpenShift.pdf (Product-specific)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Step 12: Planning Assessment Strategy

**Claude continues:**

```
📋 Assessment Planning
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Repository size: LARGE (106 files)
Strategy: Batch processing with progress tracking

Grouping files for efficient processing:

Batch 1: Assemblies + their modules (about/ directory)
  - Assembly: overview-openshift-builds.adoc
    + 4 included modules
  - Assembly: build-strategies.adoc
    + 6 included modules

Batch 2: Assemblies + their modules (installing/ directory)
  - Assembly: installing-openshift-builds.adoc
    + 8 included modules

Batch 3: Assemblies + their modules (work_with_builds/ directory)
  - Assembly: creating-container-images.adoc
    + 4 included modules
  - Assembly: managing-builds.adoc
    + 4 included modules

Batch 4: Standalone modules (modules/ directory)
  - 15 orphaned/reusable modules

Estimated processing time: 10-15 minutes
Progress updates: Every 10 files

Will assess against all 17 CQA 2.1 requirements:
  1. AsciiDoc Requirements (1)
  2. Modularization Requirements (5)
  3. Titles and Short Descriptions (3)
  4. Procedures Requirements (1)
  5. Editorial Requirements (2)
  6. URLs and Links Requirements (3)
  7. Legal and Branding Requirements (2)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Step 13: Ready to Start Analysis

**Claude asks:**

```
✅ Prerequisites verified
✅ 106 files discovered
✅ Standards loaded
✅ Assessment strategy planned

Ready to begin comprehensive CQA 2.1 audit.

This will:
  • Process all 106 files
  • Assess against 17 CQA requirements
  • Generate detailed report by assembly
  • Take approximately 10-15 minutes

Proceed with full repository audit? [Y/n]
```

---

## 🛑 DEMO STOPS HERE

At this point, the user would confirm, and Claude would begin the actual
analysis phase (Phase 2), processing each file and generating the report.

---

## What Happens Next (Not Shown in Demo)

If Jane confirms:

1. **Phase 2: Batch Assessment**
   - Process files in groups
   - Update progress every 10 files
   - Check all 17 CQA requirements

2. **Phase 3: Report Generation**
   - Create assessment report
   - Organize by assembly
   - Include aggregate statistics

3. **Phase 4: Summary**
   - Show overall compliance rate
   - List critical blockers
   - Provide migration recommendation

4. **Output:**
   ```
   assessments/assessment_openshift-docs_2026-02-27.md
   ```

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## How to Use - Quick Reference

### Starting an Audit (Natural Language - No Special Commands!)

Just open Claude Code in your project and say:

| What You Want | What You Say |
|---------------|--------------|
| Full repo audit | `Audit all files in /path/to/repo` |
| Folder audit | `Audit the files in modules/` |
| Assembly audit | `Audit assembly-X.adoc and its modules` |
| Assess specific folder | `Assess documentation in configuring/` |
| Run quality check | `Run CQA audit on /path/to/docs` |

### Before First Use

1. **Verify setup:**
   ```bash
   ./standards/verify-setup.sh
   ```

2. **Look for:**
   ```
   ✅ READY TO RUN AUDITS
   ```

3. **If you see warning about product OPL:**
   - Add your product-specific OPL PDF to standards/
   - Re-run verification

### Complete Example Session

```bash
# Open your project
$ cd ~/my-doc-project
$ claude

# Simple natural language prompt
You: Audit all files in /home/user/docs-repo

# Claude automatically:
# ✓ Checks prerequisites
# ✓ Finds all .adoc files
# ✓ Runs CQA 2.1 assessment
# ✓ Generates detailed report
# ✓ Shows compliance rate
```

### Important Notes

- ❌ **NOT a slash command** - Don't use `/doc-quality-audit`
- ✅ **Use natural language** - "Audit all files in..."
- ✅ **Flexible phrasing** - Any clear request works
- ✅ **Automatic execution** - Claude follows the skill workflow

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

END OF DEMO
