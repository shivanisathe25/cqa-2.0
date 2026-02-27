# Required Files for Doc Quality Audit

## Overview

Before running the doc-quality-audit skill, ensure ALL required files are present in the `standards/` folder.

---

## ✅ Required Files (Included in Distribution)

These files are included in the distribution package and should already be present:

- [x] `CQA-Step-by-Step-Assessment-Guide.md`
- [x] `CQA 2.1 -- Content Quality Assessment_.tsv`
- [x] `modular-docs.md`
- [x] `peer-review-style.md`
- [x] `Modular-documentation-templates-checklist.md`
- [x] `common-attributes.adoc`
- [x] `templates/` folder with official AsciiDoc templates
- [x] **OPL (Official Product List) PDF** - General product naming reference

---

## ⚠️ REQUIRED: Product-Specific Files (You Must Add)

**CRITICAL:** You MUST add your product-specific OPL PDF before running audits!

### File Naming Convention

```
standards/OPL-<product-name>.pdf
```

### Examples

- `standards/OPL-OpenShift.pdf`
- `standards/OPL-RHEL.pdf`
- `standards/OPL-Ansible.pdf`
- `standards/OPL-ClusterMonitoring.pdf`

### Where to Get Your Product OPL PDF

1. **Check your product documentation repository**
2. **Contact your documentation team lead**
3. **Check the Brand/Legal team resources**
4. **Look in your product's internal wiki/confluence**

### Why This Is Required

The product-specific OPL PDF contains:
- ✅ Official product names for your product
- ✅ Approved short forms and aliases
- ✅ Brand and Legal approval status
- ✅ Usage context restrictions (tech docs vs. general use)
- ✅ Product-specific naming conventions

**Without this file, the audit cannot verify official product names correctly!**

---

## 🔍 Pre-Flight Check

Before running the audit, verify all files are present:

### Automatic Verification (Recommended)

Run the verification script:

```bash
./standards/verify-setup.sh
```

This will check:
- ✅ All required standard files present
- ✅ Product-specific OPL PDF exists
- ✅ Templates folder is complete
- ✅ common-attributes.adoc is readable

### Manual Verification

```bash
# Check standard files
ls -la standards/*.md
ls -la standards/*.adoc
ls -la standards/*.tsv

# Check for OPL PDFs
ls -la standards/*.pdf
# Should see at least 2 PDFs:
#   - OPL-general.pdf (or similar)
#   - OPL-<your-product>.pdf

# Check templates
ls -la standards/templates/
# Should see 4 template files
```

---

## 📝 Setup Checklist for New Users

When setting up the doc-quality-audit skill:

- [ ] Extract distribution package
- [ ] Run install script
- [ ] Copy standards folder to project
- [ ] **ADD your product-specific OPL PDF to standards/**
- [ ] Run verification: `./standards/verify-setup.sh`
- [ ] ✅ Ready to audit!

---

## ❌ What Happens If Product OPL PDF Is Missing?

If you run an audit without your product-specific OPL PDF:

```
❌ ERROR: Product-specific OPL PDF not found!

The audit requires a product-specific Official Product List (OPL) PDF
to verify product names correctly.

REQUIRED ACTION:
1. Locate your product's OPL PDF
2. Copy it to: standards/OPL-<product-name>.pdf
3. Run verification: ./standards/verify-setup.sh
4. Re-run the audit

Without this file, product name validation (CQA 2.1 requirement 7.1)
cannot be performed accurately.
```

---

## 🔄 Updating Your Product OPL PDF

Product naming standards may change. Update your PDF periodically:

```bash
# Backup old version
cp standards/OPL-YourProduct.pdf standards/OPL-YourProduct-backup-$(date +%Y%m%d).pdf

# Add new version
cp /path/to/new/OPL-YourProduct.pdf standards/

# Verify
./standards/verify-setup.sh
```

---

## 🆘 Troubleshooting

### "I don't have a product-specific OPL PDF"

**Solutions:**
1. Contact your documentation team lead
2. Check your product's documentation repository
3. Check Brand/Legal team resources
4. Use the general OPL as a reference and create a product-specific list

### "My PDF has a different name"

**Options:**
1. Rename it to match convention: `OPL-<product>.pdf`
2. Create a symlink:
   ```bash
   ln -s MyProduct-Names.pdf standards/OPL-MyProduct.pdf
   ```

### "The audit says my product names are wrong but they're correct"

**Possible causes:**
1. Wrong or outdated OPL PDF
2. PDF not properly parsed
3. Product name exists but in different section of PDF

**Solutions:**
1. Verify you have the latest OPL PDF
2. Check the PDF manually for the product name
3. Report issue to the skill maintainer with details

---

## 📚 Additional Resources

- **CQA 2.1 Guide:** `CQA-Step-by-Step-Assessment-Guide.md`
- **Product Naming Requirements:** See section 7.1 in CQA guide
- **General OPL Reference:** `standards/example-cmo-product-page.md`

---

## Version

- **Last Updated:** 2026-02-27
- **Skill Version:** v2.0
- **Required for:** CQA 2.1 requirement 7.1 (Official Product Names)
