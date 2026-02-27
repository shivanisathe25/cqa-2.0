# Doc Quality Audit Skill v2.0 - Team Distribution Package

## 🎉 What's New in v2.0

### Full Repository Audit Capability
- ✅ Audits entire repositories (100+ files)
- ✅ Automated batch processing
- ✅ Assembly-based organization in reports
- ✅ Aggregate statistics and metrics
- ✅ Progress tracking for large audits
- ✅ Comprehensive migration readiness assessment

### Enhanced Reporting
- **Assembly-centric reports:** Groups modules under their parent assemblies
- **Aggregate metrics:** Repository-wide compliance rates
- **Prioritized actions:** Effort estimates for fixes
- **Character count resolution:** Automatic attribute expansion
- **File inventory:** Complete list with compliance percentages

---

## 📦 What's Included

This package contains everything your team needs to perform CQA 2.1 documentation audits at scale.

### Files Created:

1. **doc-quality-audit-skill-v2-complete.tar.gz** (~50KB)
   - Complete package with skill v2.0 + standards
   - Ready to distribute to team

2. **.claude/skills/doc-quality-audit.md** (Enhanced for full repo audits)
   - The main skill file with all audit logic
   - Supports 3 modes: repository, folder, assembly

3. **.claude/skills/README.md**
   - Updated user documentation
   - Usage examples for all three modes

4. **.claude/skills/install.sh**
   - Automated installation script

5. **SHARING_INSTRUCTIONS.md**
   - Step-by-step guide for team distribution

6. **standards/** folder
   - All CQA 2.1 reference materials
   - Templates and checklists

---

## 🚀 Quick Distribution Methods

### Method 1: Share the Complete Package (Recommended)
```bash
# Send doc-quality-audit-skill-v2-complete.tar.gz to your team

# Team members extract and use:
tar -xzf doc-quality-audit-skill-v2-complete.tar.gz
cd .claude/skills
./install.sh ~/their-doc-project
```

### Method 2: Git Repository
```bash
# Create a repo once:
git init doc-quality-audit-skill
cd doc-quality-audit-skill
cp -r .claude/skills/* .
git add .
git commit -m "Add v2.0 - Full repository audit support"
git remote add origin <your-gitlab/github-url>
git push -u origin main

# Team members clone:
git clone <repo-url>
cd doc-quality-audit-skill
./install.sh ~/their-doc-project
```

### Method 3: Direct File Share
Share just the skill file:
- `.claude/skills/doc-quality-audit.md`

Team members copy to their project:
```bash
mkdir -p .claude/skills
cp doc-quality-audit.md .claude/skills/
```

---

## 📋 What Team Members Need to Do

### Installation (4 steps - CRITICAL!)

1. **Extract and install the skill** (any method above)

2. **Copy standards folder** to their project
   ```bash
   cp -r standards /path/to/their/doc-project/
   ```

3. **⚠️ ADD Product-Specific OPL PDF** (REQUIRED!)
   ```bash
   # Each team member MUST add their product's OPL PDF
   cp /path/to/OPL-ProductName.pdf /path/to/project/standards/

   # Examples:
   # - OPL-OpenShift.pdf
   # - OPL-RHEL.pdf
   # - OPL-Ansible.pdf
   ```

   **Why this is required:**
   - Product name validation (CQA 7.1) requires product-specific OPL
   - Ensures official product names are used correctly
   - Validates approved short forms and aliases

   **Where to get it:**
   - Product documentation repository
   - Documentation team lead
   - Brand/Legal team resources

4. **Verify setup**
   ```bash
   cd /path/to/project
   ./standards/verify-setup.sh
   ```

   This will confirm:
   - ✅ All standard files present
   - ✅ Product-specific OPL PDF exists
   - ✅ Templates are complete
   - ✅ Ready to audit

5. **Use Claude Code** and ask:
   ```
   Audit all files in /path/to/docs-repo
   ```

---

## ✅ Verification

Team members can verify installation:
```bash
# Check skill is installed
ls -la .claude/skills/doc-quality-audit.md

# Check standards are present
ls -la standards/CQA-Step-by-Step-Assessment-Guide.md
```

---

## 📖 Usage Examples

### Full Repository Audit (NEW!)
```
Audit all files in /home/user/openshift-docs

Assess the entire repository at /path/to/docs
```

**What happens:**
- Discovers all .adoc files (e.g., 106 files)
- Groups by assemblies and modules
- Processes systematically with progress updates
- Generates comprehensive report with:
  - Overall compliance rate
  - Assembly-based organization
  - Aggregate statistics
  - Prioritized fix list
  - Migration recommendation

### Folder Audit
```
Audit the files in /path/to/modules/

Assess documentation in configuring/
```

### Assembly-Based Audit
```
Audit assembly-monitoring.adoc and all its modules

Assess creating-container-images.adoc with its included modules
```

---

## 🎯 What It Does

### CQA 2.1 Requirements (17 checks)
- ✅ AsciiDoc compliance
- ✅ Modular documentation structure
- ✅ Template adherence
- ✅ Titles & short descriptions (with attribute resolution)
- ✅ Prerequisites formatting
- ✅ Grammar & American English
- ✅ Content type correctness
- ✅ Broken links detection
- ✅ Product naming validation
- ✅ Legal disclaimers

### New in v2.0
- ✅ Full repository scanning
- ✅ Batch processing (100+ files)
- ✅ Assembly-based report organization
- ✅ Aggregate compliance metrics
- ✅ Progress tracking
- ✅ Character count with automatic attribute resolution
- ✅ Effort estimates for fixes
- ✅ Migration decision matrix

---

## 📊 Report Format

Reports are organized by assembly name:

```
Assembly: creating-container-images
  Status: ✅ COMPLIANT (100%)
  Modules:
    ✅ ob-creating-a-buildah-build.adoc (Procedure) - 100%
    ✅ ob-creating-a-s2i-build.adoc (Procedure) - 100%
    ✅ ob-creating-a-buildpacks-build.adoc (Procedure) - 100%

Assembly: managing-builds
  Status: ⚠️ MINOR ISSUES (94%)
  Modules:
    ✅ ob-editing-resources.adoc (Procedure) - 100%
    ❌ ob-deleting-build.adoc (Procedure) - 82% (Short desc too short)
```

**Plus:**
- Executive summary with aggregate stats
- Critical blockers list
- Prioritized action items with effort estimates
- Complete file inventory
- Character count details
- Migration readiness checklist

---

## 🔄 Updates from v1.0

### Breaking Changes
None - v2.0 is fully backward compatible with v1.0

### New Features
1. **Full repository audit mode**
2. **Assembly-based report organization**
3. **Aggregate statistics and metrics**
4. **Enhanced character count resolution**
5. **Effort estimation for fixes**
6. **Migration decision matrix**

### Migration from v1.0
Simply replace the old `doc-quality-audit.md` file with the new version. No other changes needed.

---

## 💡 Tips for Teams

### For Documentation Managers
```
"Audit all files in /home/team/product-docs"
```
Get repository-wide compliance rate, identify problem areas, estimate fix effort.

### For Technical Writers
```
"Audit assembly-my-feature.adoc and all its modules"
```
Quick check before submitting PR.

### For Migration Planning
```
"Audit all files in /legacy-docs"
```
Assess migration readiness, get prioritized action list.

---

## 📈 Performance

### Small Projects (<20 files)
- **Duration:** 1-2 minutes
- **Mode:** Direct processing

### Medium Projects (20-50 files)
- **Duration:** 3-5 minutes
- **Mode:** Batch processing

### Large Projects (100+ files)
- **Duration:** 10-15 minutes
- **Mode:** Batch processing with progress updates

---

## 🛠️ Troubleshooting

### "Attribute not found" errors
- Ensure common-attributes.adoc exists in repo
- Check _attributes/common-attributes.adoc as alternative location

### Slow performance on large repos
- Normal for 100+ files (expect 10-15 minutes)
- Progress updates provided every 10-20 files

### Report not generated
- Check assessments/ folder was created
- Verify write permissions

---

## Support

For questions, refer to:
- `.claude/skills/README.md`
- `SHARING_INSTRUCTIONS.md`
- `standards/CQA-Step-by-Step-Assessment-Guide.md`

---

**Version:** v2.0 - Full Repository Support
**Release Date:** 2026-02-27
**CQA Standards:** CQA 2.1
**Package Size:** ~50KB
