# Documentation Quality Audit Skill - Full Repository Assessment

Perform comprehensive CQA 2.1 (Content Quality Assessment) on entire documentation repositories with automated batch processing.

## Purpose

This skill audits complete documentation repositories against Red Hat's CQA 2.1 standards, supporting:
- Full repository scans (100+ files)
- Batch processing with progress tracking
- Assembly-based analysis (audits assemblies + their included modules)
- Comprehensive reporting with aggregated metrics
- Migration readiness assessment

## Input

The user will provide ONE of:
1. **Repository path** - Audits all .adoc files in the repository
   ```
   Audit all files in /path/to/docs-repo
   ```

2. **Folder path** - Audits all .adoc files in specific folder
   ```
   Audit the files in /path/to/folder
   ```

3. **Assembly file path** - Audits assembly + all its included modules
   ```
   Audit assembly-file.adoc and all its modules
   ```

## Workflow

### Phase 0: Prerequisites Verification (CRITICAL!)

**Before starting any audit, verify all required files exist:**

#### Required Files Check

Use Bash to verify files:

```bash
# Check core standards files
ls standards/CQA-Step-by-Step-Assessment-Guide.md
ls standards/modular-docs.md
ls standards/peer-review-style.md
ls standards/templates/*.adoc
ls standards/common-attributes.adoc

# Check for OPL PDFs (CRITICAL for product name validation)
ls standards/*.pdf
```

**If any files are missing:**
1. **STOP the audit immediately**
2. **Report to user:**
   ```
   ❌ PREREQUISITE CHECK FAILED

   Missing required files:
   - [List missing files]

   REQUIRED ACTION:
   1. Run verification: standards/verify-setup.sh
   2. Follow instructions to add missing files
   3. Re-run this audit

   See: standards/REQUIRED_FILES_README.md
   ```
3. **Do NOT proceed with audit**

**Special Check: Product-Specific OPL PDF**

CRITICAL: User MUST have their product-specific OPL PDF in standards/

Check:
```bash
# Look for product-specific OPL PDFs (naming: OPL-ProductName.pdf)
ls standards/OPL-*.pdf
```

If NOT found:
```
⚠️ WARNING: Product-specific OPL PDF not found!

Found general OPL: standards/OPL.pdf ✓
Missing: standards/OPL-<ProductName>.pdf ❌

Product name validation (CQA 7.1) cannot be performed accurately
without your product-specific OPL PDF.

REQUIRED ACTIONS:
1. Obtain your product's Official Product List (OPL) PDF from:
   - Your product documentation repository
   - Documentation team lead
   - Brand/Legal team resources

2. Save it as: standards/OPL-<ProductName>.pdf
   Example: OPL-OpenShift.pdf, OPL-RHEL.pdf

3. Run verification: ./standards/verify-setup.sh

4. Re-run this audit

See detailed instructions: standards/REQUIRED_FILES_README.md

Do you want to proceed with the audit anyway? (Results may be incomplete)
```

**Only proceed if:**
- ✅ All core standards files present
- ✅ At least general OPL.pdf present (warn if no product-specific)
- ✅ Templates folder complete
- ✅ common-attributes.adoc exists

### Phase 1: Discovery & Planning

#### 1. Locate and Read Standards
Read assessment standards from the `standards/` folder:
- `standards/CQA-Step-by-Step-Assessment-Guide.md`
- `standards/CQA 2.1 -- Content Quality Assessment_.tsv`
- `standards/modular-docs.md`
- `standards/peer-review-style.md`
- `standards/Modular-documentation-templates-checklist.md`
- `standards/templates/` - Official AsciiDoc templates
- `standards/common-attributes.adoc` - For character count resolution

#### 2. Identify All Files to Audit
Use Glob and Bash to discover files:

**For repository/folder audit:**
```bash
find <path> -name "*.adoc" -type f
```

Group files by type:
- **Assemblies:** Files with `:_mod-docs-content-type: ASSEMBLY`
- **Procedures:** Files with `:_mod-docs-content-type: PROCEDURE`
- **Concepts:** Files with `:_mod-docs-content-type: CONCEPT`
- **References:** Files with `:_mod-docs-content-type: REFERENCE`
- **Other:** Files without content-type metadata

**For assembly-based audit:**
- Read the assembly file
- Extract all `include::` statements
- Locate all referenced module files
- Audit assembly + all modules

#### 3. Create Task List
Use TaskCreate to track progress:
- Total files found
- Files by type
- Processing status

### Phase 2: Batch Assessment

#### Strategy for Large Repositories (50+ files)

**Use parallel processing:**
- Group files into logical batches (by directory or content type)
- Process assemblies with their modules as units
- Track progress with TaskUpdate

**Sample grouping:**
```
Batch 1: /installing/*.adoc (10 files)
Batch 2: /configuring/*.adoc (15 files)
Batch 3: /about/*.adoc (8 files)
...
```

#### For Each File: Perform Full CQA 2.1 Assessment

### A. AsciiDoc Requirements

**1.2 Assembly Structure** (Required/non-negotiable)
- Only intro section and includes
- Additional resources at end (or between includes as exception)
- No text between includes (except additional resources)
- Blank lines between includes
- ✅ or ❌ with file:line references

### B. Modularization Requirements

**2.1 Content is Modularized** (Required/non-negotiable)
- Proper separation of concept/procedure/reference
- Modules are discrete and reusable
- ✅ or ❌

**2.2 Modules Use Official Templates** (Required/non-negotiable)
- Compare to appropriate template
- Check `:_mod-docs-content-type:` metadata
- Verify ID format `[id="filename_{context}"]`
- Confirm single level 0 title
- Check for `[role="_abstract"]`
- ✅ or ❌ with file:line references

**2.3 All Required Elements Present** (Required/non-negotiable)
Checklist per file type:

**All modules:**
- `:_mod-docs-content-type:` attribute
- Topic ID with `_{context}` suffix
- Single level 0 (=) title
- `[role="_abstract"]` short description
- Blank line between title and description

**Assemblies additionally:**
- `:context:` declaration
- Blank lines between includes
- No level 2+ headers

**2.4 Assemblies Use Template & User Stories** (Required/non-negotiable)
- Template compliance
- Represents complete user story
- Task-based titles use gerunds
- ✅ or ❌

**2.5 TOC Nesting Depth** (Important/negotiable)
- Score: 4 (≤3 levels), 3 (mostly ≤3), 2 (often >3), 1 (excessive)

### C. Titles and Short Descriptions

**3.1 Clear Short Descriptions** (Required/non-negotiable)
- Describes why user should read
- Concise for link previews/search
- Includes SEO keywords
- No self-referential language
- ✅ or ❌

**3.2 AsciiDoc Short Description Format** (Required/non-negotiable)
**CRITICAL PROCESS:**
1. Extract first paragraph after `[role="_abstract"]`
2. Find attribute file (common-attributes.adoc or _attributes/common-attributes.adoc)
3. Resolve ALL attributes (e.g., {product-title}, {builds-shortname})
4. Count characters of resolved text
5. Verify 50-300 character range
6. Report both raw and resolved counts

Example:
```
Raw: "Manage {builds-shortname} resources" (35 chars)
Resolved: "Manage Builds resources" (23 chars) ❌ Too short
```

- ✅ or ❌ with actual counts

**3.4 Brief, Complete, Descriptive Titles** (Required/non-negotiable)
- Not overly wordy
- Contains essential information
- Clear purpose
- Procedures start with gerunds
- ✅ or ❌

### D. Procedures Requirements

**4.1 Prerequisites Formatting** (Required/non-negotiable)
- Uses "Prerequisites" label
- Consistent formatting
- Max 10 prerequisites
- No steps (conditions only)
- ✅ or ❌

### E. Editorial Requirements

**5.1 Grammar and American English** (Required/non-negotiable)
- Grammatically correct
- American English spelling
- ✅ or ❌

**5.2 Correct Content Type Usage** (Required/non-negotiable)
- Concept: explanations only
- Procedure: step-by-step only
- Reference: lookup data only
- Assembly: user story composition
- ✅ or ❌

### F. URLs and Links

**6.1 No Broken Links** (Required/non-negotiable)
- Check external URLs
- Verify internal xrefs
- Verify include paths exist
- ✅ or ❌ with list of broken links

**6.2 Working Redirects** (Required/non-negotiable)
- Test redirects if applicable
- ✅ or ❌ or N/A

**6.3 Page Interlinking** (Important/negotiable)
- Reachable within 3 clicks
- Good cross-references
- Score: 4, 3, 2, or 1

### G. Legal and Branding

**7.1 Official Product Names** (Required/non-negotiable)
- Check against product page examples
- Full names on first use
- Approved short forms
- ✅ or ❌

**7.2 Legal Disclaimers** (Required/non-negotiable)
- Tech Preview disclaimers present
- Developer Preview disclaimers present
- ✅ or ❌ or N/A

### Phase 3: Generate Comprehensive Repository Report

Create file: `assessments/assessment_<repository-name>_<date>.md`

#### Report Structure

```markdown
# CQA 2.1 Assessment Report: <Repository Name>

**Assessment Date:** YYYY-MM-DD
**Repository Path:** /full/path/to/repo
**Total Files Assessed:** N files
**Overall Status:** ✅ READY / ⚠️ NEEDS WORK / ❌ NOT READY

---

## Executive Summary

### Compliance Metrics
- **Overall Compliance Rate:** X% (Y/Z requirements met across all files)
- **Files Passing All Checks:** N/Total (X%)
- **Critical Blockers:** N issues requiring fixes
- **Advisory Issues:** N recommendations

### Status Distribution
| Status | Count | Percentage |
|--------|-------|------------|
| ✅ Fully Compliant | N | X% |
| ⚠️ Minor Issues | N | X% |
| ❌ Critical Issues | N | X% |

### Scores by Category (Repository-wide)
| Category | Requirements Met | Percentage |
|----------|------------------|------------|
| AsciiDoc | X/Y files | Z% |
| Modularization | X/Y files | Z% |
| Titles & Descriptions | X/Y files | Z% |
| Procedures | X/Y files | Z% |
| Editorial | X/Y files | Z% |
| URLs & Links | X/Y files | Z% |
| Legal & Branding | X/Y files | Z% |

### File Type Distribution
- **Assemblies:** N files (X% compliant)
- **Procedures:** N files (X% compliant)
- **Concepts:** N files (X% compliant)
- **References:** N files (X% compliant)
- **Other:** N files (X% compliant)

---

## Critical Blockers (Must Fix Before Migration)

### High Priority Issues
1. **Issue Type:** Description
   - **Affected Files:** N files
   - **Files:** file1.adoc, file2.adoc, ...
   - **Fix Required:** [Specific action]

2. **Issue Type:** Description
   - **Affected Files:** N files
   - **Files:** ...

### Character Count Violations
| File | Raw Count | Resolved Count | Status |
|------|-----------|----------------|--------|
| file.adoc | 45 chars | 35 chars | ❌ Too short |
| file2.adoc | 350 chars | 320 chars | ❌ Too long |

### Missing Required Elements
| File | Missing Elements |
|------|------------------|
| file.adoc | :context: declaration, _{context} in ID |
| file2.adoc | [role="_abstract"] |

---

## Advisory Issues (Recommended Improvements)

### TOC Nesting Issues
- **Files with >3 levels:** N files
- **List:** file1.adoc (4 levels), file2.adoc (5 levels)

### Enhancement Opportunities
1. **Additional Resources:** N files could benefit from adding this section
2. **Cross-references:** N files lack internal links

---

## Detailed Assessment by Assembly/File

Organize by assemblies with their included modules grouped together.

### Assembly: creating-container-images
**File:** work_with_builds/creating-container-images.adoc
**Status:** ✅ COMPLIANT
**Compliance:** 17/17 requirements met (100%)

#### Assembly Assessment

##### Quick Summary
- ✅ AsciiDoc structure perfect
- ✅ All required elements present
- ✅ Short description: 145 chars (resolved)
- ✅ Title uses gerund form
- ✅ All links valid
- ✅ Includes 4 modules

##### Included Modules (4)
1. ✅ ob-creating-a-buildah-build.adoc (Procedure) - 100%
2. ✅ ob-creating-a-s2i-build.adoc (Procedure) - 100%
3. ✅ ob-creating-a-buildpacks-build.adoc (Procedure) - 100%
4. ✅ ob-creating-a-build-with-oci-artifacts.adoc (Procedure) - 100%

##### Detailed Findings
**No issues found.** ✅

---

#### Module: ob-creating-a-buildah-build.adoc
**Type:** Procedure
**Status:** ✅ COMPLIANT
**Compliance:** 17/17 requirements met (100%)

##### Assessment
- ✅ Template compliance perfect
- ✅ Short description: 89 chars (resolved)
- ✅ Prerequisites: 3 items, well-formatted
- ✅ Procedure section with numbered steps
- ✅ Verification section included
- **No issues found.**

---

#### Module: ob-creating-a-s2i-build.adoc
**Type:** Procedure
**Status:** ✅ COMPLIANT

[Continue for each module in assembly]

---

### Assembly: managing-builds
**File:** work_with_builds/managing-builds.adoc
**Status:** ⚠️ MINOR ISSUES
**Compliance:** 16/17 requirements met (94%)

#### Assembly Assessment

##### Quick Summary
- ✅ AsciiDoc structure correct
- ✅ All required elements present
- ⚠️ Additional resources section commented out
- ✅ Includes 4 modules

##### Included Modules (4)
1. ✅ ob-editing-the-resources.adoc (Procedure) - 100%
2. ❌ ob-deleting-a-build-resource.adoc (Procedure) - 82% (Short desc too short)
3. ✅ ob-deleting-a-buildrun-resource.adoc (Procedure) - 100%
4. ✅ ob-deleting-a-buildstrategy-resource.adoc (Procedure) - 100%

##### Issues Found

**6.3 Page Interlinking** ⚠️ ADVISORY
- **Issue:** Additional resources section is commented out (lines 22-24)
- **Impact:** Reduces discoverability of related content
- **Recommendation:** Uncomment and populate Additional resources section
- **Priority:** Low (Advisory only)

---

#### Module: ob-deleting-a-build-resource.adoc
**Type:** Procedure
**Status:** ❌ CRITICAL ISSUES
**Compliance:** 14/17 requirements met (82%)

##### Issues Found

**3.2 Short Description Format** ❌ FAIL
- **Line:** 10
- **Raw text:** "Delete {builds-shortname}." (24 chars)
- **Resolved text:** "Delete Builds." (14 chars)
- **Problem:** Below 50-character minimum (needs 36 more characters)
- **Fix Required:** Expand short description. Example: "Delete unused Build custom resources to maintain a clean build configuration environment."
- **Priority:** CRITICAL (Blocking migration)

##### Passing Checks
- ✅ Template structure correct
- ✅ ID format valid
- ✅ Title uses gerund form
- ✅ Prerequisites: 2 items, well-formatted
- ✅ Procedure steps clear

---

[Continue for each module]

---

### Standalone Modules (Not in Assemblies)

#### Module: making-open-source-more-inclusive.adoc
**Type:** Concept
**Status:** ✅ COMPLIANT
**Note:** This module is not included in any assembly

[Assessment details]

---

##### Issues Found

**3.2 Short Description Format** ❌ FAIL
- **Line:** 10
- **Raw text:** "Use {product-title}." (22 chars)
- **Resolved text:** "Use OpenShift Container Platform." (35 chars)
- **Problem:** Below 50-character minimum
- **Fix Required:** Expand short description to at least 50 characters

**4.1 Prerequisites Formatting** ❌ FAIL
- **Line:** 15
- **Problem:** Contains step "Install the operator" instead of condition
- **Fix Required:** Change to "You have installed the operator"

##### Passing Checks
- ✅ Template structure correct
- ✅ ID format valid
- ✅ Title uses gerund form
- ... (list other passing items)

---

[Repeat for each file]

---

## Files by Status

### ✅ Fully Compliant (N files)
Files ready for migration with zero issues:
- installing/file1.adoc
- configuring/file2.adoc
- ...

### ⚠️ Minor Issues (N files)
Files with advisory issues only:
- about/file3.adoc (TOC nesting: 4 levels)
- modules/file4.adoc (Missing Additional resources)

### ❌ Critical Issues (N files)
Files requiring fixes before migration:
- modules/file5.adoc (Short description too short)
- modules/file6.adoc (Prerequisites contain steps)
- ...

---

## Most Common Issues

### By Frequency
1. **Short descriptions too short:** N files
   - Average character count: X
   - Most common in: [file type/directory]

2. **Missing _{context} in ID:** N files
   - Mostly affects: [assemblies/modules]

3. **Prerequisites contain steps:** N files
   - All in procedure modules

4. **TOC nesting >3 levels:** N files

5. **Missing :context: declaration:** N files

### By Impact
1. **Blocking Migration (Required/non-negotiable):**
   - Character count violations: N files
   - Missing required elements: N files
   - Template non-compliance: N files

2. **Should Fix (Important/negotiable):**
   - TOC nesting: N files
   - Missing cross-references: N files

---

## Recommended Actions (Prioritized)

### Phase 1: Critical Fixes (Before Migration)
**Estimated effort:** X hours

1. **Fix short description character counts** (N files)
   - Expand descriptions <50 chars
   - Trim descriptions >300 chars
   - Resolve all attributes before counting

2. **Add missing required elements** (N files)
   - Add :context: declarations
   - Add _{context} to IDs
   - Add [role="_abstract"] markup

3. **Fix prerequisites formatting** (N files)
   - Convert steps to conditions
   - Reduce lists >10 items

### Phase 2: Quality Improvements (Optional)
**Estimated effort:** X hours

1. **Improve TOC structure** (N files)
   - Flatten nesting >3 levels

2. **Add cross-references** (N files)
   - Add Additional resources sections
   - Improve internal linking

---

## Migration Readiness Checklist

### Critical Requirements
- [ ] All Required/non-negotiable items pass (currently: X%)
- [ ] Character counts verified with resolved attributes
- [ ] Template compliance verified
- [ ] Product names validated
- [ ] Links tested and functional
- [ ] Content types properly separated

### Current Status
- **Files passing all critical checks:** N/Total (X%)
- **Blockers remaining:** N issues across Y files

### Migration Decision Matrix

| Criteria | Status | Notes |
|----------|--------|-------|
| 100% of files pass required checks | ✅/❌ | N files failing |
| <5% files have advisory issues | ✅/❌ | X% have issues |
| No broken links | ✅/❌ | N broken links found |
| All products properly named | ✅/❌ | |

**Final Recommendation:**

✅ **READY FOR MIGRATION** - All files meet CQA 2.1 requirements
OR
⚠️ **READY WITH FIXES** - Complete Phase 1 actions (est. X hours)
OR
❌ **NOT READY** - Significant rework needed (est. X hours)

---

## Appendix A: File Inventory

### Complete File List with Status

| File Path | Type | Status | Issues | Compliance |
|-----------|------|--------|--------|------------|
| installing/file1.adoc | Assembly | ✅ | 0 | 100% |
| modules/mod1.adoc | Procedure | ❌ | 2 | 88% |
| ... | ... | ... | ... | ... |

### Files by Directory

#### /installing (N files)
- ✅ file1.adoc (Assembly)
- ✅ file2.adoc (Assembly)

#### /configuring (N files)
- ⚠️ file3.adoc (Assembly) - TOC nesting
- ✅ file4.adoc (Assembly)

#### /modules (N files)
- ❌ mod1.adoc (Procedure) - Short desc, prereqs
- ✅ mod2.adoc (Concept)
- ...

---

## Appendix B: Character Count Details

Full analysis of all short descriptions with attribute resolution:

| File | Raw | Resolved | Status |
|------|-----|----------|--------|
| file1.adoc | "Use {product-title} to..." (40) | "Use OpenShift Container Platform to..." (65) | ✅ |
| file2.adoc | "Configure {builds-shortname}" (29) | "Configure Builds" (16) | ❌ |

---

## Assessment Metadata

- **Assessor:** Claude Code doc-quality-audit skill
- **Skill Version:** 2.0 (Full Repository)
- **Standards Version:** CQA 2.1
- **Assessment Date:** YYYY-MM-DD
- **Assessment Duration:** X minutes
- **Total Files Scanned:** N
- **Files Assessed:** N (100%)
- **Standards References:**
  - CQA-Step-by-Step-Assessment-Guide.md
  - CQA 2.1 -- Content Quality Assessment_.tsv
  - modular-docs.md
  - peer-review-style.md
  - Official templates in templates/ folder

---

## Next Steps

1. **Review this report** with the documentation team
2. **Prioritize fixes** using the Recommended Actions section
3. **Assign issues** from Critical Blockers list
4. **Track progress** against Migration Readiness Checklist
5. **Re-run assessment** after fixes to verify compliance
6. **Schedule migration** once all critical issues resolved

---

**Questions?** Refer to:
- `standards/CQA-Step-by-Step-Assessment-Guide.md`
- `standards/peer-review-style.md`
- `.claude/skills/README.md`
```

### Phase 4: Progress Tracking

Throughout assessment, use TaskUpdate to show progress:
- Mark files as completed
- Update completion percentage
- Highlight any blocking issues discovered

### Phase 5: Summary Report to User

After generating the assessment file, provide:
- **Location** of assessment report
- **Executive summary:**
  - Total files assessed
  - Overall compliance rate
  - Critical blockers count
  - Migration readiness status
- **Top 5 most critical issues** to address
- **Estimated effort** to fix critical issues
- **Clear migration recommendation**

## Optimization Strategies

### For Large Repositories (100+ files)

1. **Parallel Processing:**
   - Group files by directory
   - Process each group concurrently
   - Aggregate results

2. **Progressive Reporting:**
   - Report progress every 10 files
   - Update task list
   - Warn user of time required

3. **Smart Sampling:**
   - If user requests quick assessment, offer to sample
   - Suggest: "Audit 20% of files (N files) for quick check?"
   - Provide full vs. sample options

4. **Caching:**
   - Read common-attributes.adoc once
   - Reuse template files for comparisons
   - Cache standard references

### Batch Processing Pattern

```
For 106 files:
- Read standards (1x)
- Read attributes (1x)
- Process files in batches of 20
- Generate aggregate statistics
- Create single comprehensive report
```

## Important Implementation Notes

1. **Character Counting:**
   - ALWAYS resolve attributes before counting
   - Use common-attributes.adoc from repo if available
   - Fall back to standards/common-attributes.adoc
   - Show both raw and resolved counts

2. **Attribute Resolution:**
   - Look for _attributes/common-attributes.adoc first
   - Then check root for common-attributes.adoc
   - Parse attribute definitions: `:name: value`
   - Replace {name} with value before counting

3. **Link Checking:**
   - For xref: verify file exists
   - For http/https: check if accessible (optional, can be slow)
   - For include: verify path exists

4. **Context Variables:**
   - Don't assume missing - verify by reading file
   - Check for `:context: value` pattern
   - Required in assemblies

5. **Progress Communication:**
   - Report every 10-20 files processed
   - Estimate time remaining
   - Show running compliance rate

## Tools to Use

- **Glob** - Find all .adoc files
- **Bash** - File operations, counting
- **Read** - Read files
- **Grep** - Search for patterns
- **TaskCreate/TaskUpdate** - Progress tracking
- **Write** - Generate report

## Output Location

All assessment reports saved to:
```
assessments/assessment_<repo-name>_<YYYY-MM-DD>.md
```

Create assessments/ folder if it doesn't exist.

## Example Usage Patterns

User says:
```
"Audit all files in /home/user/openshift-docs"
```

You:
1. Find all .adoc files (discovers 106 files)
2. Report: "Found 106 files. Starting comprehensive audit..."
3. Create tasks for tracking
4. Process all files
5. Generate report: assessments/assessment_openshift-docs_2026-02-27.md
6. Report: "✅ Assessed 106 files. 98% compliant. See full report at..."

## Success Criteria

A successful audit produces:
- ✅ Complete file inventory
- ✅ Individual assessment for each file
- ✅ Aggregated statistics
- ✅ Prioritized action list
- ✅ Clear migration recommendation
- ✅ Detailed character counts with attribute resolution
- ✅ File:line references for all issues
- ✅ Estimated effort for fixes
