# Doc Quality Audit Skill - Team Distribution Package

## 📦 What's Included

This package contains everything your team needs to perform CQA 2.1 documentation audits with Claude Code.

### Files Created:

1. **doc-quality-audit-skill-complete.tar.gz** (50KB)
   - Complete package with skill + standards
   - Ready to distribute to team

2. **.claude/skills/doc-quality-audit.md** (393 lines)
   - The main skill file with all audit logic

3. **.claude/skills/README.md**
   - User documentation

4. **.claude/skills/install.sh**
   - Automated installation script

5. **SHARING_INSTRUCTIONS.md**
   - Step-by-step guide for team distribution

6. **standards/** folder
   - All CQA 2.1 reference materials
   - Templates and checklists

## 🚀 Quick Distribution Methods

### Method 1: Share the Complete Package (Recommended)
```bash
# Send doc-quality-audit-skill-complete.tar.gz to your team

# Team members extract and use:
tar -xzf doc-quality-audit-skill-complete.tar.gz
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
git commit -m "Initial commit"
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

## 📋 What Team Members Need to Do

1. **Install the skill** (any method above)
2. **Ensure they have standards/** folder in their project
3. **Use Claude Code** and ask:
   ```
   Audit the files in <folder>
   ```

## ✅ Verification

Team members can verify installation:
```bash
# Check skill is installed
ls -la .claude/skills/doc-quality-audit.md

# Check standards are present
ls -la standards/CQA-Step-by-Step-Assessment-Guide.md
```

## 📖 Usage Examples

```
Audit the files in tasks/

Audit assembly-monitoring.adoc and all its modules

Assess the documentation in modules/ against CQA 2.1
```

## 🔄 Updates

When you update the skill:
1. Redistribute the new `doc-quality-audit.md` file
2. Or team members pull from git repo
3. Or send updated tar.gz package

## 🎯 What It Does

- ✅ Checks 17 CQA 2.1 requirements
- ✅ Validates AsciiDoc compliance
- ✅ Verifies modular documentation standards
- ✅ Checks titles, descriptions, prerequisites
- ✅ Validates grammar, links, product names
- ✅ Generates detailed assessment reports
- ✅ Provides file:line references for all issues

## 📊 Output

Creates `assessments/assessment_<topic>.md` with:
- Executive summary
- Pass/fail for each requirement
- Detailed findings per file
- Prioritized fix recommendations
- Migration readiness checklist

## Support

For questions, refer to:
- `.claude/skills/README.md`
- `SHARING_INSTRUCTIONS.md`
- `standards/CQA-Step-by-Step-Assessment-Guide.md`

---

**Version:** CQA 2.1 - February 2026
**Package Created:** 2026-02-26
