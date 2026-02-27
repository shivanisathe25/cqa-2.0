# Sharing the Doc Quality Audit Skill with Your Team

## Quick Start for Team Members

### Option 1: Direct File Copy (Simplest)

Share these files with your team:
- `.claude/skills/doc-quality-audit.md`
- `.claude/skills/README.md`

**Installation:**
```bash
# In their project directory
mkdir -p .claude/skills
cp doc-quality-audit.md .claude/skills/
```

### Option 2: Using the Install Script

Share the entire `.claude/skills/` folder and run:

```bash
cd path/to/received/skills/folder
./install.sh /path/to/their/project
```

### Option 3: Git Repository (Recommended for Teams)

1. **Create a Git Repo** (you do this once):
   ```bash
   cd .claude/skills
   git init
   git add doc-quality-audit.md README.md install.sh
   git commit -m "Add doc-quality-audit skill"
   # Push to your team's Git server (GitLab, GitHub, etc.)
   ```

2. **Team Members Clone**:
   ```bash
   git clone <your-repo-url> ~/doc-quality-audit-skill
   cd ~/doc-quality-audit-skill
   ./install.sh /path/to/their/project
   ```

## What Team Members Need

### 1. The Skill File
They need `doc-quality-audit.md` in their project's `.claude/skills/` folder.

### 2. Standards Folder
Each team member's project needs a `standards/` folder with:
- `CQA-Step-by-Step-Assessment-Guide.md`
- `CQA 2.1 -- Content Quality Assessment_.tsv`
- `modular-docs.md`
- `peer-review-style.md`
- `Modular-documentation-templates-checklist.md`
- `templates/` folder
- `common-attributes.adoc`

**Share these too!** You can create a standards package:
```bash
tar -czf cqa-standards.tar.gz standards/
# Share this file with team
```

Team members extract:
```bash
tar -xzf cqa-standards.tar.gz
```

## Usage for Team Members

Once installed, anyone can use it in Claude Code:

```
Audit the files in tasks/
```

or

```
Audit assembly-monitoring.adoc and all its modules
```

Claude will automatically:
1. Read the CQA standards
2. Analyze all files
3. Generate a detailed assessment report in `assessments/`

## Distribution Options

### A. Internal Git Server
Push to your team's GitLab/GitHub Enterprise

### B. Shared Network Drive
```bash
# Package everything
tar -czf doc-quality-audit-skill.tar.gz .claude/skills standards/

# Team members extract:
tar -xzf doc-quality-audit-skill.tar.gz
```

### C. Email/Chat
Zip and share:
```bash
zip -r doc-quality-audit-skill.zip .claude/skills/ standards/
```

## Updating the Skill

When you update the skill:
```bash
cd .claude/skills
git add doc-quality-audit.md
git commit -m "Update audit criteria"
git push

# Team members update:
git pull
./install.sh /path/to/their/project
```

## Support

Team members can check if it's installed:
```bash
ls -la .claude/skills/doc-quality-audit.md
```

If they see the file, it's ready to use!
