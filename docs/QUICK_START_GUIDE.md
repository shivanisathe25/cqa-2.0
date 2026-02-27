# Quick Start Guide - Doc Quality Audit Skill v2.0

## For You (Sharing with Team)

### Files to Share
Located at: `/home/ssathe/claude-doc-quality-assessment-project/`

**Option 1: Complete Package (Recommended)**
```bash
doc-quality-audit-skill-v2-complete.tar.gz (53KB)
```
Send this file via email/Slack/shared drive

**Option 2: Documentation**
```bash
TEAM_DISTRIBUTION_SUMMARY_v2.md
SHARING_INSTRUCTIONS.md
```
Include these for instructions

### Quick Share Command
```bash
# Copy to shared location
cp doc-quality-audit-skill-v2-complete.tar.gz /path/to/shared/drive/

# Or email it
# Attach: doc-quality-audit-skill-v2-complete.tar.gz
# Attach: TEAM_DISTRIBUTION_SUMMARY_v2.md
```

---

## For Your Team (Using the Skill)

### Installation (3 steps)

1. **Extract the package**
   ```bash
   tar -xzf doc-quality-audit-skill-v2-complete.tar.gz
   ```

2. **Run installer**
   ```bash
   cd .claude/skills
   ./install.sh /path/to/your/doc-project
   ```

3. **Copy standards folder**
   ```bash
   cp -r standards /path/to/your/doc-project/
   ```

### Usage

**IMPORTANT: This is NOT a slash command!** Use natural language instead.

Open your documentation project in Claude Code and just say what you want:

**Full Repository Audit:**
```
Audit all files in /home/user/my-docs
```
(Also works: "Assess all documentation in...", "Run CQA audit on...", etc.)

**Folder Audit:**
```
Audit the files in configuring/
```

**Assembly Audit:**
```
Audit assembly-monitoring.adoc and all its modules
```

**Why not /doc-quality-audit?**
- ❌ This is NOT a registered slash command
- ✅ Just describe what you want in plain English
- ✅ Claude automatically follows the skill workflow
- ✅ More flexible and natural

### What You Get

A comprehensive report at:
```
assessments/assessment_<repo-name>_<date>.md
```

With:
- ✅ Overall compliance rate (% of files passing)
- ✅ Assembly-based organization
- ✅ Critical blockers list
- ✅ Prioritized fix recommendations
- ✅ Migration readiness assessment

---

## Example Workflow

### Scenario: Pre-Migration Assessment

1. **Run full audit**
   ```
   Audit all files in /home/user/product-docs
   ```

2. **Review report** (generated in ~10-15 mins for 100+ files)
   ```
   assessments/assessment_product-docs_2026-02-27.md
   ```

3. **Check executive summary**
   - Overall compliance: 87%
   - Critical blockers: 12 issues
   - Effort estimate: 4 hours

4. **Fix critical issues** using prioritized action list

5. **Re-run audit** to verify
   ```
   Audit all files in /home/user/product-docs
   ```

6. **Migration decision**
   - 100% compliance ✅ → Ready for migration!

---

## Sample Report Structure

```markdown
# CQA 2.1 Assessment Report

## Executive Summary
- Overall Compliance: 98% (104/106 files passing)
- Critical Blockers: 2 files
- Advisory Issues: 5 files

## Assembly: creating-container-images
Status: ✅ COMPLIANT (100%)
Modules:
  ✅ ob-creating-a-buildah-build.adoc (100%)
  ✅ ob-creating-a-s2i-build.adoc (100%)

## Assembly: managing-builds
Status: ❌ CRITICAL ISSUES (82%)
Modules:
  ✅ ob-editing-resources.adoc (100%)
  ❌ ob-deleting-build.adoc (82%)
    Issue: Short description too short (35 chars, need 50+)
    Fix: Expand description by 15+ characters

## Prioritized Actions
1. Fix short descriptions (2 files, 15 min)
2. Add missing context declarations (1 file, 5 min)
```

---

## Troubleshooting

### "Skill not found"
- Verify file exists: `ls -la .claude/skills/doc-quality-audit.md`
- Reinstall: `./install.sh /path/to/project`

### "Standards not found"
- Copy standards folder: `cp -r standards /path/to/project/`

### "Slow performance"
- Normal for 100+ files (10-15 minutes)
- Progress updates provided during processing

### Report not generated
- Check `assessments/` folder created
- Verify write permissions

---

## Quick Reference

| Task | Command |
|------|---------|
| Full repo audit | `Audit all files in /path/to/repo` |
| Folder audit | `Audit the files in modules/` |
| Assembly audit | `Audit assembly-X.adoc and its modules` |
| Find report | `ls assessments/` |
| View report | Open `assessments/assessment_*.md` |

---

## Support

- **Skill Documentation:** `.claude/skills/README.md`
- **Sharing Guide:** `SHARING_INSTRUCTIONS.md`
- **CQA Standards:** `standards/CQA-Step-by-Step-Assessment-Guide.md`
- **Team Guide:** `TEAM_DISTRIBUTION_SUMMARY_v2.md`

---

## Version Info

- **Version:** v2.0
- **Release Date:** 2026-02-27
- **CQA Standards:** CQA 2.1
- **New Features:** Full repository audits, assembly-based reports
- **Backward Compatible:** Yes (with v1.0)

---

**Happy Auditing!** 🎉
