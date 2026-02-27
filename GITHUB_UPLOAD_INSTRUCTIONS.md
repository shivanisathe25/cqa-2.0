# How to Upload to GitHub

## Quick Setup (5 minutes)

### Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `doc-quality-audit-skill`
3. Description: `CQA 2.1 documentation quality audit skill for Claude Code`
4. Visibility:
   - **Public** (if sharing widely)
   - **Private** (if internal team only)
5. **DO NOT** initialize with README, .gitignore, or license (we have these)
6. Click "Create repository"

### Step 2: Initialize and Push

```bash
cd /home/ssathe/claude-doc-quality-assessment-project

# Initialize git (if not already done)
git init

# Add all files
git add .

# First commit
git commit -m "Initial commit: Doc Quality Audit Skill v2.0

Features:
- Full repository audits (100+ files)
- Assembly-based report organization
- Automatic prerequisite verification
- Product-specific OPL support
- CQA 2.1 compliance (17 checks)
- Natural language interface"

# Add GitHub remote (replace with your URL)
git remote add origin https://github.com/YOUR-USERNAME/doc-quality-audit-skill.git

# Push to GitHub
git push -u origin main
```

### Step 3: Verify Upload

1. Go to https://github.com/YOUR-USERNAME/doc-quality-audit-skill
2. Check that all files are present:
   - ✅ README.md shows properly
   - ✅ .claude/skills/ folder visible
   - ✅ standards/ folder visible
   - ✅ docs/ folder visible
   - ✅ LICENSE file present

---

## Repository Structure on GitHub

```
doc-quality-audit-skill/
├── README.md                        ← Main documentation
├── LICENSE                          ← Apache 2.0
├── .gitignore                       ← Ignore patterns
├── .claude/
│   └── skills/
│       ├── doc-quality-audit.md     ← Main skill
│       ├── README.md
│       └── install.sh
├── standards/
│   ├── CQA-Step-by-Step-Assessment-Guide.md
│   ├── modular-docs.md
│   ├── peer-review-style.md
│   ├── templates/
│   ├── OPL.pdf                      ← Your general OPL
│   ├── REQUIRED_FILES_README.md
│   └── verify-setup.sh
├── docs/
│   ├── QUICK_START_GUIDE.md
│   ├── USER_EXPERIENCE_DEMO.md
│   ├── SOLUTION_SUMMARY.md
│   ├── HOW_TO_MAKE_SLASH_COMMAND.md
│   ├── TEAM_DISTRIBUTION_SUMMARY_v2.md
│   └── SHARING_INSTRUCTIONS.md
└── assessments/
    └── .gitkeep                     ← Placeholder
```

---

## Sharing with Your Team

### Option 1: Public Repository

If public, team members can:

```bash
# Clone directly
git clone https://github.com/YOUR-USERNAME/doc-quality-audit-skill.git
cd doc-quality-audit-skill

# Install
cd .claude/skills
./install.sh ~/their-project

# Copy standards
cd ../..
cp -r standards ~/their-project/
```

### Option 2: Private Repository

Add team members as collaborators:

1. Go to repository Settings → Collaborators
2. Click "Add people"
3. Enter their GitHub usernames
4. They get access to clone

### Option 3: Release Package

Create a release for easy download:

1. Go to repository → Releases → "Create a new release"
2. Tag version: `v2.0.0`
3. Release title: `Doc Quality Audit Skill v2.0`
4. Attach `doc-quality-audit-skill-v2-complete.tar.gz`
5. Publish release

Team members download from: `https://github.com/YOUR-USERNAME/doc-quality-audit-skill/releases`

---

## GitHub Features to Use

### 1. Issues

Enable issue tracking for bug reports and feature requests:
- Repository → Settings → General → Features → Issues (check)

### 2. Wiki

Create a wiki for additional documentation:
- Repository → Wiki → Create the first page

### 3. GitHub Pages

Host documentation as a website:

```bash
# Create gh-pages branch
git checkout --orphan gh-pages
git rm -rf .
echo "# Doc Quality Audit Skill" > index.md
git add index.md
git commit -m "Initial GitHub Pages"
git push origin gh-pages
```

Enable Pages:
- Settings → Pages → Source: gh-pages branch → Save

Your docs will be at: `https://YOUR-USERNAME.github.io/doc-quality-audit-skill`

### 4. Topics

Add topics to make it discoverable:
- Click "Add topics" near the description
- Suggested: `documentation`, `quality-assurance`, `claude-code`, `cqa`, `asciidoc`, `red-hat`

---

## Update Workflow

### When You Make Changes

```bash
# Make your changes
git add .
git commit -m "Update: Description of changes"
git push origin main
```

### Team Members Update

```bash
cd doc-quality-audit-skill
git pull origin main

# Reinstall if skill changed
cd .claude/skills
./install.sh ~/their-project
```

---

## Best Practices

### 1. Semantic Versioning

Use tags for versions:

```bash
git tag -a v2.0.0 -m "Version 2.0: Full repository audit support"
git push origin v2.0.0
```

### 2. Changelog

Create `CHANGELOG.md`:

```markdown
# Changelog

## [2.0.0] - 2026-02-27

### Added
- Full repository audit support (100+ files)
- Assembly-based report organization
- Automatic prerequisite verification
- Product-specific OPL requirement
- Verification script (verify-setup.sh)
- Comprehensive documentation

### Changed
- Report format now organized by assembly
- Enhanced character count resolution
- Improved error messages

## [1.0.0] - 2026-02-26

### Added
- Initial release
- Basic audit functionality
```

### 3. Contributing Guide

Create `CONTRIBUTING.md`:

```markdown
# Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## Code Style
- Clear commit messages
- Document new features
- Update CHANGELOG.md
```

### 4. GitHub Actions (Optional)

Automate testing with `.github/workflows/test.yml`:

```yaml
name: Test

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Run verification script
        run: |
          cd standards
          bash verify-setup.sh
```

---

## Security Considerations

### Sensitive Information

**DO NOT commit:**
- ❌ Product-specific OPL PDFs (users add their own)
- ❌ Internal company documents
- ❌ Private credentials
- ❌ Assessment results from real projects

**Safe to commit:**
- ✅ General OPL PDF (already included)
- ✅ Public CQA standards
- ✅ Templates
- ✅ Documentation

### If You Accidentally Commit Sensitive Data

```bash
# Remove from history (use carefully!)
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch standards/SECRET-FILE.pdf" \
  --prune-empty --tag-name-filter cat -- --all

git push origin --force --all
```

Or use GitHub's guide: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository

---

## Example README Updates

After uploading, update these placeholders in README.md:

```markdown
# Replace this:
https://github.com/yourusername/doc-quality-audit-skill

# With your actual URL:
https://github.com/YOUR-ACTUAL-USERNAME/doc-quality-audit-skill
```

---

## Final Checklist

Before pushing to GitHub:

- [ ] Review all files for sensitive information
- [ ] Update README.md with your GitHub username
- [ ] Test clone and install on a fresh system
- [ ] Add appropriate LICENSE (Apache 2.0 included)
- [ ] Create .gitignore (included)
- [ ] Write clear commit messages
- [ ] Add repository description
- [ ] Add topics/tags
- [ ] Enable Issues if you want bug reports
- [ ] Consider adding CHANGELOG.md

---

## Post-Upload Tasks

1. **Share with team:**
   ```
   Hey team! I've uploaded the doc-quality-audit skill to GitHub:
   https://github.com/YOUR-USERNAME/doc-quality-audit-skill

   To install:
   1. git clone [url]
   2. cd .claude/skills && ./install.sh ~/your-project
   3. cp -r standards ~/your-project/
   4. Add your product OPL PDF
   5. Run ./standards/verify-setup.sh

   Full instructions in the README!
   ```

2. **Create releases** for major versions

3. **Monitor issues** for questions/bugs

4. **Update regularly** as CQA standards evolve

---

## Support Resources

- **GitHub Docs:** https://docs.github.com
- **Git Basics:** https://git-scm.com/book/en/v2
- **Markdown Guide:** https://guides.github.com/features/mastering-markdown/

---

**You're ready to upload to GitHub!** 🚀
