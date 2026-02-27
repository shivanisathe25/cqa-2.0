# CQA 2.1 Step-by-Step Assessment Guide
## Content Quality Assessment - Pre-migration

---

## Overview
This guide provides detailed step-by-step procedures to assess each criterion in the CQA 2.1 document using available reference materials. Each assessment follows the 4-point scoring system with specific criteria for Required/non-negotiable vs Important/negotiable items.

### Task for claude: 
Analyse the files in the "tasks/" folder and assess them against the following requirements.  For each category in the document, provide:
- Assessment
- Reason for the assessment
- Add the checkmark vs cross if it passed/failed.

Create a detailed file called "assessment_<topic>.md" where you output the assessment from this guide. Save the assessment file in the existing /assessments folder.

### Assessment Scoring System
- **4 = Meets criteria** (Available for all requirements)
- **3 = Mostly meets criteria** (Important/negotiable only)
- **2 = Mostly does not meet criteria** (Important/negotiable only)
- **1 = Does not meet criteria** (Available for all requirements)
- **No score = Not applicable** / **No score = No data** (Not yet assessed)

### Reference Materials Used
1. `modular-docs.md` - Official modular documentation standards
2. `peer-review-style.md` - Editorial and style guidelines
3. `Modular-documentation-templates-checklist.txt` - Technical validation checklist
4. `templates/` folder - Official AsciiDoc templates
5. `<product>-product-page.md` - Product naming authority
6. `common-attributes.adoc` - AsciiDoc attribute definitions for character count calculations

---

## 1. AsciiDoc Requirements

### 1.1 Vale asciidoctor-dita-vale Tool Check
**Quality Level:** Required/non-negotiable
**Requirement:** "Content passes this Vale asciidoctor-dita-vale tool check with no errors or warnings"

--> skip this assessment

#### Reference Materials:
- CQA Document Row 37: Vale tool requirements
- Note: The AsciiDocDITA tool identifies markup without DITA 1.3 equivalents

---

### 1.2 Assembly Structure Requirements
**Quality Level:** Required/non-negotiable
**Requirement:** "Assemblies should contain only an introductory section, which can be one or more paragraphs, and include statements. You can also have an Additional resources section at the end of the assembly, after all of the includes. DITA maps do not accept text between include statements for modules." There is an exception that additional resources can appear in between the include statements. Do not ignore this exception.

#### Assessment Steps:
1. **Identify All Assembly Files:**
   - Locate files with `_mod-docs-content-type: ASSEMBLY`
   - List all `.adoc` files with assembly naming pattern

2. **Check Assembly Structure:**
   - **Introduction Section:** Verify assemblies start with introductory paragraph(s) only
   - **Include Statements:** Confirm only module includes between introduction and additional resources
   - **Additional Resources:** Verify this section appears only at the end (if present), or is in between include statements (exception)
   - **No Text Between Includes:** Ensure no content exists between include statements (except additional resources, which is allowed)

3. **Validate Against Template:**
   - Compare structure to `templates/TEMPLATE_ASSEMBLY_a-collection-of-modules.adoc`
   - Check for proper context handling (`ifdef::context[:parent-context: {context}]`). This is not needed in the assembly, skip, because we do not have nested assemblies
   - Verify blank lines between include statements - you can ignore asciidoc "//" comments for this bullet point. Those do not count.

4. **Assessment Criteria:**
   - **Score 4:** All assemblies follow required structure exactly
   - **Score 1:** Any assembly violates the structure requirements
   - **Note:** No partial scoring allowed for Required/non-negotiable items

#### Reference Materials:
- `templates/TEMPLATE_ASSEMBLY_a-collection-of-modules.adoc` (lines 34-75)
- CQA Document Row 38: Assembly structure note

---

## 2. Modularization Requirements

### 2.1 Content is Modularized
**Quality Level:** Required/non-negotiable
**Requirement:** "Content is modularized"

#### Assessment Steps:
1. **Content Structure Analysis:**
   - Map content to user stories
   - Map content to customer lifecycle phases (Plan, Install, Configure, Manage, etc.)
   - Identify distinct concept, procedure, and reference components
   - Verify content is broken into discrete, reusable modules
   - Cross-reference with `modular-docs.md` standards for proper modularization

2. **Module Type Verification:**
   - **Concept Modules:** Explanatory content that helps users understand
   - **Procedure Modules:** Step-by-step instructions with numbered lists
   - **Reference Modules:** Lookup data, configuration tables, command lists
   - **Validate against `modular-docs.md`:** Ensure each module type follows documented standards

3. **Assembly Validation:**
   - Confirm assemblies represent complete user stories
   - Verify assemblies combine modules logically
   - Check that assemblies don't exceed recommended complexity
   - Ensure assemblies align with customer journey and lifecycle phases

4. **Assessment Criteria:**
   - **Score 4:** Content is fully modularized with clear separation of concerns
   - **Score 1:** Content remains monolithic or poorly modularized

#### Reference Materials:
- `modular-docs.md` sections on module types and structure
- Customer product lifecycle phases (Plan, Install, Configure, etc.)

---

### 2.2 Modules Use Official Templates
**Quality Level:** Required/non-negotiable
**Requirement:** "Modules use the official templates: - Concept - Procedure - Reference"

#### Assessment Steps:
1. **Template Compliance Check:**
   - Compare each module against official templates in `templates/` folder
   - **Concept Template:** `templates/TEMPLATE_CONCEPT_concept-explanation.adoc`
   - **Procedure Template:** `templates/TEMPLATE_PROCEDURE_doing-one-procedure.adoc`
   - **Reference Template:** `templates/TEMPLATE_REFERENCE_reference-material.adoc`

2. **Structural Elements Verification:**
   - **All Modules:** Check for `_mod-docs-content-type` metadata
   - **All Modules:** Verify proper ID format `[id="filename_{context}"]`
   - **All Modules:** Confirm single level 0 title (=)
   - **All Modules:** Check for `[role="_abstract"]` short introduction

3. **Module-Specific Requirements:**
   - **Concept:** No imperative statements, descriptive content only
   - **Procedure:** Contains `.Procedure` block title with ordered/unordered list
   - **Reference:** Structured data presentation (tables, lists)

4. **Assessment Criteria:**
   - **Score 4:** All modules strictly follow official templates
   - **Score 1:** Any module deviates from official template structure

#### Reference Materials:
- All files in `templates/` folder
- `Modular-documentation-templates-checklist.txt` (lines 7-16)
- `modular-docs.md` file naming conventions

---

### 2.3 All Required/Non-Negotiable Modular Elements Present
**Quality Level:** Required/non-negotiable
**Requirement:** "All Required/non-negotiable modular elements are present"

#### Assessment Steps:
1. **Universal Module Elements Check:**
   - `:_mod-docs-content-type:` metadata attribute present
   - Topic ID in format `[id="<file-name>_{context}"]`
   - One and only one level 0 (=) title (H1)
   - Short introduction paragraph
   - Blank line between title and introduction
   - Alternative text for images in quotation marks
   - Admonitions without titles

2. **Assembly-Specific Elements:**
   - Blank line between each include statement
   - No level 2 (===) section titles or lower
   - No block titles (except approved ones)
   - **Context declaration:** `:context: assembly-name` must be present
   - **ID format:** Must include `_{context}` (e.g., `[id="assembly-name_{context}"]`)
   - Proper context handling for nested assemblies

3. **Module-Type Specific Elements:**
   - **Concept/Reference:** No imperative statements, no level 2+ headers
   - **Procedure:** Required `.Procedure` block title, approved optional sections only

4. **Conditional Elements for Nested Assemblies:**
   - `ifdef::context[:parent-context: {context}]` at top
   - `ifdef::parent-context[:context: {parent-context}]` at bottom
   - Context variable declared (`:context: some-assembly`)

5. **Critical Assessment Points:**
   - **Context Declaration:** Carefully verify `:context:` variable exists - do not assume it's missing
   - **ID Format:** Check that assembly ID includes `_{context}` suffix
   - **Systematic Review:** Read each file completely before marking elements as missing

6. **Assessment Criteria:**
   - **Score 4:** All required elements present in all modules/assemblies
   - **Score 1:** Any required element missing from any module/assembly

#### Reference Materials:
- `Modular-documentation-templates-checklist.txt` (complete checklist)
- `templates/` folder (all template files)
- CQA Document Row 46: References to checklist

---

### 2.4 Assemblies Use Official Template & Represent User Stories
**Quality Level:** Required/non-negotiable
**Requirement:** "Assemblies use the official template. Assemblies are one user story."

#### Assessment Steps:
1. **Template Compliance:**
   - Compare all assemblies to `templates/TEMPLATE_ASSEMBLY_a-collection-of-modules.adoc`
   - Verify proper metadata, context handling, structure

2. **User Story Validation:**
   - Map each assembly to specific user story
   - Ensure assembly describes complete user workflow
   - Confirm assembly addresses single coherent task/goal

3. **Title Requirements (Task-Based Assemblies):**
   - If assembly includes procedure modules: title starts with gerund (Creating, Configuring)
   - If no procedures: use noun phrase
   - Examples: "Encrypting block devices using LUKS" vs "Red Hat Process Automation Manager API reference"

4. **Structural Validation:**
   - Introduction describes user accomplishments and context
   - Prerequisites section (if applicable)
   - Logical module inclusion sequence
   - Optional Next steps section
   - Optional Additional resources section

5. **Assessment Criteria:**
   - **Score 4:** All assemblies follow template and represent complete user stories
   - **Score 1:** Any assembly deviates from template or fails to represent coherent user story

#### Reference Materials:
- `templates/TEMPLATE_ASSEMBLY_a-collection-of-modules.adoc`
- `modular-docs.md` content strategy based on customer lifecycle phases
- CQA Document Row 47: Assembly requirements

---

### 2.5 Content TOC Nesting Depth
**Quality Level:** Important/negotiable
**Requirement:** "Content is not deeply nested in the TOC (recommended: no more than 3 levels)"

#### Assessment Steps:
1. **TOC Structure Analysis:**
   - Map content hierarchy depth
   - Count levels from where content starts (exclude categories/repetitive book titles)
   - Identify deepest nested content sections

2. **Migration Context Consideration:**
   - Start counting from actual content location, not Pantheon-generated categories
   - Consider readability and navigation usability
   - Evaluate user experience impact

3. **Assessment Criteria:**
   - **Score 4:** No content exceeds 3 levels of nesting
   - **Score 3:** Mostly within 3 levels, minor exceptions for logical reasons
   - **Score 2:** Frequent nesting beyond 3 levels, but some sections comply
   - **Score 1:** Excessive nesting throughout content structure

4. **Note:** This is negotiable - deeper nesting may be justified for complex technical content

#### Reference Materials:
- CQA Document Row 48: TOC nesting guidance
- `modular-docs.md` assembly organization principles

---

## 3. Titles and Short Descriptions

### 3.1 Clear Short Descriptions (DITA Requirements)
**Quality Level:** Required/non-negotiable
**Requirement:** "Modules and assemblies start with a clear short description. A short description: - Describes why the user should read the content - Uses concise language that will be used as a link preview or for summaries in search results - Includes keywords that users are likely to search on for SEO and AI - Must not include self referential language ('This document describes...')"

#### Assessment Steps:
1. **Identify All Short Descriptions:**
   - Locate `[role="_abstract"]` sections in modules and assemblies
   - Verify every module/assembly has a short description

2. **Content Quality Analysis:**
   - **Purpose Clarity:** Does it explain why users should read this content?
   - **Concise Language:** Is language suitable for link previews and search summaries?
   - **SEO Keywords:** Does it include terms users would search for?
   - **Self-Reference Check:** Eliminate phrases like "This document describes," "This section covers," etc.

3. **User-Focused Language:**
   - Focus on user benefits and outcomes
   - Use active voice when possible
   - Include relevant technical terms and product names

4. **Assessment Criteria:**
   - **Score 4:** All short descriptions meet all criteria
   - **Score 1:** Any short description fails to meet any criterion

5. **Common Violations to Check:**
   - Self-referential language
   - Vague or generic descriptions
   - Missing keywords
   - Too verbose or too brief

#### Reference Materials:
- CQA Document Row 54: DITA short description requirements
- OASIS DITA specification: https://docs.oasis-open.org/dita/dita/v1.3/errata02/os/complete/part3-all-inclusive/langRef/base/shortdesc.html
- "Rewrite for Impact: DITA short descriptions" reference

---

### 3.2 AsciiDoc Short Description Format
**Quality Level:** Required/non-negotiable
**Requirement:** "In asciidoc, short descriptions must be: - be a single paragraph between 50 and 300 characters - Introduced with [role='_abstract'] - Include a blank line between the level 0 (=) title and the short description in asciidoc"

#### Assessment Steps:
1. **Format Validation:**
   - Check for `[role="_abstract"]` markup before short description
   - Verify blank line exists between level 0 title (=) and short description
   - **First Paragraph Assessment:** Only the first paragraph after `[role="_abstract"]` is assessed for character count
   - **Additional Paragraphs Allowed:** Multiple paragraphs within the abstract block are permitted - only assess the first one

2. **Character Count Verification:**
   - **Target:** Count characters in the FIRST PARAGRAPH only of each short description
   - Must be minimum 50 characters
   - Must not exceed 300 characters
   - Include spaces and punctuation in count
   - **Additional Content:** Ignore subsequent paragraphs within the same `[role="_abstract"]` block for character counting
   - **Attribute Handling:** Replace AsciiDoc attributes with their actual values before counting:
     - Use `common-attributes.adoc` to find attribute definitions
     - Replace `{attribute-name}` with actual text from the attributes file
     - Count characters of the resolved text, not the attribute reference
     - Example: `{cmo-full}` → `Cluster Monitoring Operator` (26 characters, not 10)

3. **Technical Implementation Check:**
   ```asciidoc
   = Module Title

   [role="_abstract"]
   This is the short description that must be between 50-300 characters. <-- ASSESS THIS

   Additional explanatory content can appear here in subsequent paragraphs. <-- IGNORE FOR CHARACTER COUNT
   This content provides context but is not part of the short description assessment.
   ```

4. **Assessment Criteria:**
   - **Score 4:** All short descriptions (first paragraphs) meet format and length requirements exactly
   - **Score 1:** Any short description (first paragraph) violates format or character limits

5. **Character Count Tools:**
   - **First:** Replace all attributes with actual values from `common-attributes.adoc`
   - **Target:** Extract only the first paragraph for counting
   - Use word processor character count feature on the resolved text
   - Command line: `echo "resolved description" | wc -c`
   - Verify count includes/excludes trailing newlines appropriately
   - **Tip:** Create a temporary copy of first paragraphs only with attributes resolved for accurate counting

6. **Common Assessment Errors to Avoid:**
   - **Do not** flag multi-paragraph abstracts as format violations
   - **Do not** include subsequent paragraphs in character counts
   - **Do** verify first paragraph meets 50-300 character requirement
   - **Do** check that `[role="_abstract"]` markup is present

#### Reference Materials:
- CQA Document Row 55: AsciiDoc format requirements
- `templates/` - all template files show proper `[role="_abstract"]` usage
- `common-attributes.adoc` - attribute definitions for accurate character counting
- "Rewrite for Impact: DITA short descriptions" reference

---

### 3.3 Short, Long, and Descriptive Titles (DITA Support)
**Quality Level:** Important/negotiable
**Requirement:** "Content has a short, long, and descriptive title (requires DITA support)"

#### Assessment Steps:
1. **Title Structure Analysis:**
   - **Short Title:** Brief identifier for navigation
   - **Long Title:** Complete descriptive title for context
   - **Descriptive Elements:** Clear indication of content purpose and scope

2. **DITA Compatibility Check:**
   - Verify titles will work with DITA transformation
   - Consider how titles appear in various output formats
   - Check for DITA-specific title requirements

3. **Assessment Criteria:**
   - **Score 4:** All content has appropriate short and long titles with DITA support
   - **Score 3:** Most content has good titles, minor improvements needed
   - **Score 2:** Some content has appropriate titles, significant gaps exist
   - **Score 1:** Titles are generally inadequate or missing DITA support

4. **Note:** This is negotiable and depends on DITA implementation capabilities

#### Reference Materials:
- CQA Document Row 56: Title requirements note
- `modular-docs.md` title guidelines
- DITA title specifications

---

### 3.4 Brief, Complete, and Descriptive Titles
**Quality Level:** Required/non-negotiable
**Requirement:** "Titles are brief, complete, and descriptive"

#### Assessment Steps:
1. **Title Quality Analysis:**
   - **Brief:** Not unnecessarily wordy or verbose
   - **Complete:** Contains all essential information
   - **Descriptive:** Clearly indicates content purpose and scope

2. **Module-Specific Title Rules:**
   - **Procedure Modules:** Start with gerund form (Creating, Installing, Deploying)
   - **Concept Modules:** Use noun phrases that clearly identify the concept
   - **Reference Modules:** Indicate the type of reference information
   - **Assemblies:** Follow user story naming conventions

3. **Style Guidelines Check:**
   - Use title case appropriately
   - Avoid unnecessary articles (a, an, the) when possible
   - Use parallel structure for similar content types
   - Ensure consistency across related modules

4. **Assessment Criteria:**
   - **Score 4:** All titles are brief, complete, and descriptive
   - **Score 1:** Any title fails to meet all three criteria

5. **Reference Guidelines:**
   - Check against modular documentation reference guide procedures
   - Validate using peer review checklist for style

#### Reference Materials:
- CQA Document Row 57: References to modular documentation guide and peer review checklist
- `modular-docs.md` title guidelines for different module types
- `peer-review-style.md` style checklist sections
- `templates/` - example titles in template files

---

## 4. Procedures Requirements

### 4.1 Prerequisites Formatting
**Quality Level:** Required/non-negotiable
**Requirement:** "If a procedures includes prerequisites: - Use the Prerequisites label - Use consistent formatting Do not exceed 10 prerequisites. Do not include steps in prerequisites."

#### Assessment Steps:
1. **Prerequisites Section Identification:**
   - Locate all procedure modules with prerequisites
   - Verify use of exact label "Prerequisites" (or approved variant "Prerequisite")

2. **Formatting Consistency Check:**
   - Consistent bullet format across all prerequisites sections
   - Parallel grammatical structure (full sentences OR sentence fragments consistently)
   - Proper indentation and spacing

3. **Content Validation:**
   - **Count Limit:** No more than 10 prerequisites per procedure
   - **No Steps:** Prerequisites describe conditions, not actions to take
   - **No Imperatives:** Avoid command language in prerequisites

4. **Proper Prerequisites Examples:**
   - ✅ "X is installed"
   - ✅ "You have administrator privileges"
   - ✅ "Network connectivity is available"
   - ❌ "Install X" (this is a step, not a prerequisite)
   - ❌ "Complete the installation procedure" (this is a step)

5. **Assessment Criteria:**
   - **Score 4:** All prerequisite sections follow all formatting and content rules
   - **Score 1:** Any prerequisite section violates any rule

#### Reference Materials:
- CQA Document Row 63: Prerequisites requirements
- `templates/TEMPLATE_PROCEDURE_doing-one-procedure.adoc` (lines 30-33)
- `Modular-documentation-templates-checklist.txt` approved section list

---

## 5. Editorial Requirements

### 5.1 Grammar and American English
**Quality Level:** Required/non-negotiable
**Requirement:** "Content is grammatically correct and follows rules of American English grammar"

#### Assessment Steps:
1. **Grammar Tools and Checks:**
   - Run spell check using American English dictionary
   - Use grammar checking tools (Grammarly, built-in tools)
   - Manual review for complex grammatical structures

2. **American English Standards:**
   - **Spelling:** Use American spellings (color vs colour, organize vs organise)
   - **Punctuation:** Follow American punctuation rules for quotes, periods
   - **Date Formats:** Use American conventions (MM/DD/YYYY)

3. **Common Grammar Areas:**
   - Subject-verb agreement
   - Proper tense consistency
   - Correct pronoun usage
   - Parallel structure in lists
   - Proper sentence structure

4. **Technical Writing Standards:**
   - Consistent terminology usage
   - Clear, concise sentences
   - Active voice preference
   - Appropriate technical register

5. **Assessment Criteria:**
   - **Score 4:** All content is grammatically correct with proper American English
   - **Score 1:** Any grammatical errors or non-American English usage found

#### Reference Materials:
- CQA Document Row 69: Grammar requirements
- `peer-review-style.md` language and style sections
- IBM Style Guide referenced in peer review materials

---

### 5.2 Correct Content Type Usage
**Quality Level:** Required/non-negotiable
**Requirement:** "Information is conveyed using the correct content type"

#### Assessment Steps:
1. **Content Type Mapping:**
   - **Concept Information:** Explanations, background, theory → Concept modules
   - **Procedural Information:** Step-by-step instructions → Procedure modules
   - **Reference Information:** Lookup data, tables, commands → Reference modules
   - **User Stories:** Complete workflows → Assemblies

2. **Content Type Validation:**
   - No instructional content in concept modules
   - No explanatory essays in procedure modules
   - No step-by-step instructions in reference modules
   - Assemblies combine modules appropriately for user stories

3. **Mixed Content Identification:**
   - Flag content that combines multiple types inappropriately
   - Recommend proper content type separation
   - Verify information architecture aligns with user needs

4. **Assessment Criteria:**
   - **Score 4:** All information uses appropriate content types
   - **Score 1:** Any content uses incorrect content type

#### Reference Materials:
- CQA Document Row 70: Content type requirements
- `modular-docs.md` sections defining module types and purposes
- `templates/` - examples of appropriate content for each type

---

## 6. URLs and Links Requirements

### 6.1 No Broken Links
**Quality Level:** Required/non-negotiable
**Requirement:** "No broken links"

#### Assessment Steps:
1. **Link Identification:**
   - Scan all content for external URLs
   - Identify internal cross-references (xref:)
   - Locate include statements and file references

2. **Automated Link Checking:**
   - Use link checker tools (linkchecker, broken-link-checker)
   - Test external URLs for HTTP status codes
   - Verify internal file references exist

3. **Manual Verification:**
   - Test problematic links manually
   - Check for redirects that should be updated
   - Verify links resolve to expected content

4. **Documentation Requirements:**
   - List all links found
   - Document any broken links with error details
   - Provide fix recommendations

5. **Assessment Criteria:**
   - **Score 4:** All links are functional and resolve correctly
   - **Score 1:** Any broken links found

#### Reference Materials:
- CQA Document Row 76: Broken links requirement

---

### 6.2 Working Redirects
**Quality Level:** Required/non-negotiable
**Requirement:** "Redirects (if needed) are in place and work correctly"

#### Assessment Steps:
1. **Redirect Identification:**
   - Identify content that has moved or been restructured
   - Locate URLs that should redirect to new locations
   - Find legacy links that need redirect support

2. **Redirect Testing:**
   - Verify redirects return appropriate HTTP status codes (301, 302)
   - Confirm redirects point to correct new locations
   - Test redirect chains don't exceed reasonable limits

3. **Documentation:**
   - Map old URLs to new URLs
   - Document redirect implementation method
   - Verify redirects work across different access methods

4. **Assessment Criteria:**
   - **Score 4:** All necessary redirects are in place and working correctly
   - **Score 1:** Any required redirects are missing or broken

#### Reference Materials:
- CQA Document Row 77: Redirects requirement

---

### 6.3 Page Interlinking Depth
**Quality Level:** Important/negotiable
**Requirement:** "Page is interlinked and within three clicks of the domain's home page"

#### Assessment Steps:
1. **Navigation Path Measurement:**
   - Start counting from main product documentation entry point
   - Count each menu click, link click, or navigation action
   - **Example path:** Home → OpenShift Docs → Monitoring → Configure Stack = 3 clicks ✅
   - Document the actual path taken for each piece of content
   - Map navigation paths from home page to content
   - Count clicks required to reach each page
   - Identify orphaned content not reachable within three clicks

2. **Interlinking Assessment:**
   - Verify appropriate internal cross-references
   - Check for related content connections
   - Assess discoverability of content

3. **Assessment Criteria:**
   - **Score 4:** All content reachable within 3 clicks and well-interlinked
   - **Score 3:** Most content meets requirements, minor navigation issues
   - **Score 2:** Some content difficult to reach, poor interlinking
   - **Score 1:** Content frequently requires more than 3 clicks or is orphaned

4. **Note:** This is negotiable based on site architecture and content complexity

#### Reference Materials:
- CQA Document Row 78: Interlinking requirements

---

## 7. Legal and Branding Requirements

### 7.1 Official Product Names
**Quality Level:** Required/non-negotiable
**Requirement:** "Official product names are used"

#### Assessment Steps:
1. **Product Name Identification:**
   - Scan content for all product references
   - Create list of products mentioned
   - Cross-reference with `<product>-product-page.md` - Product naming authority
     - For each product mentioned in content:
       - Record full official name
       - Note approved aliases/short forms
       - Check Brand and Legal approval status
       - Verify usage context restrictions (general use vs tech docs only)
   - **Critical Check:** Products like CMO have conditional approval (tech docs only)
   - **Cluster Monitoring Operator Example:** Full name required, CMO acceptable for tech docs only
   - **monitoring stack Example:** Lowercase official name, no approved aliases

3. **Brand Compliance Check:**
   - Verify products have Brand and Legal approval
   - Check for products with compliance warnings
   - Ensure proper usage context (general use vs tech docs only)

4. **Usage Rules Application:**
   - **First Use:** Always use full official product name
   - **Subsequent Uses:** May use approved short forms/acronyms if applicable
   - **Context Restrictions:** Respect tech docs vs general use limitations

5. **Assessment Criteria:**
   - **Score 4:** All product names used correctly according to OPL guidelines
   - **Score 1:** Any incorrect product name usage

#### Reference Materials:
- CQA Document Row 84: Product naming requirement
- `cmo-product-page.md` - example of non-compliant product (CMO acceptable for tech docs only)
- `monitoring-stack-product-page.md` - example of compliant product (approved by Brand/Legal)

---

### 7.2 Legal Disclaimers for Preview Features
**Quality Level:** Required/non-negotiable
**Requirement:** "Includes appropriate, legal-approved disclaimers for Technology Preview and Developer Preview features/content"

#### Assessment Steps:
1. **Preview Feature Identification:**
   - Scan content for Technology Preview features
   - Identify Developer Preview capabilities
   - Locate beta or experimental functionality

2. **Disclaimer Requirements:**
   - **Technology Preview:** Must include legal-approved TP disclaimer
   - **Developer Preview:** Must include legal-approved DP disclaimer
   - **Placement:** Disclaimers should appear prominently near feature descriptions

3. **Snippet Usage:**
   - Use approved disclaimer snippets in assembly files
   - Verify snippets will resolve correctly during migration
   - Ensure consistent disclaimer language

4. **Legal Approval Verification:**
   - Confirm disclaimer text is current and legal-approved
   - Check for any updated disclaimer requirements
   - Verify disclaimer covers appropriate scope

5. **Assessment Criteria:**
   - **Score 4:** All preview features have appropriate, legal-approved disclaimers
   - **Score 1:** Any preview feature lacks proper disclaimer

#### Reference Materials:
- CQA Document Row 85: Legal disclaimers requirement
- Legal team-approved disclaimer snippets
- Technology Preview and Developer Preview documentation standards

---

## Assessment Documentation Template

### For Each Requirement:
```markdown
## Requirement: [Requirement Name]
**Quality Level:** [Required/non-negotiable | Important/negotiable]
**Score:** [4 | 3 | 2 | 1 | Not applicable | No data]

### Assessment Results:
- **Files Reviewed:** [List of files checked]
- **Issues Found:** [Specific issues with file:line references]
- **Compliance Status:** [Pass/Fail with details]
- **Recommendations:** [Specific actions needed for compliance]

### Evidence:
- **Screenshots:** [If applicable]
- **Tool Output:** [Vale results, link checker output, etc.]
- **Manual Verification:** [Notes from manual review]

### Evidence Documentation Requirements:
- **Character Counts:** Always show both original and resolved counts for attribute-based content
- **Template Compliance:** Reference specific template file lines (e.g., "line 30 of TEMPLATE_PROCEDURE")
- **Product Names:** List all products found and their OPL status with approval context
- **Links:** Provide full URL and test status for each link checked
- **File References:** Include specific file:line references for all issues found
- **Tool Results:** Include relevant portions of automated tool output
```

---

## Final Assessment Report Template

### Summary Dashboard
```markdown
## CQA 2.1 Assessment Summary

**Overall Readiness:** [Ready/Not Ready for Migration]

### Scores by Category:
- **AsciiDoc:** [X/2 requirements met]
- **Modularization:** [X/5 requirements met]
- **Titles & Descriptions:** [X/4 requirements met]
- **Procedures:** [X/1 requirements met]
- **Editorial:** [X/2 requirements met]
- **URLs & Links:** [X/3 requirements met]
- **Legal & Branding:** [X/2 requirements met]

### Critical Blockers (Required/Non-negotiable failures):
[List any failed Required/non-negotiable items]

### Recommendations:
[Priority-ordered list of required fixes]

### Migration Readiness Checklist:
- [ ] All Required/non-negotiable items scored 4
- [ ] Character counts verified with resolved attributes
- [ ] Template compliance verified against specific templates
- [ ] Product names validated against current OPL database
- [ ] Links tested and functional
- [ ] Content type alignment verified
- [ ] No critical blockers identified
```

This comprehensive guide provides specific, actionable steps to assess each CQA criterion using your available reference materials. Each assessment is mapped to appropriate scoring criteria and includes clear pass/fail conditions based on the requirement's quality level.

---

## Practical Assessment Examples

### Example 1: Template Compliance Check
**Assembly File Check:**
```
File: <file>.adoc
- Line 1: `:_mod-docs-content-type: ASSEMBLY` ✅
- Line 3: `[id="assembly-name_{context}"]` ✅
- Line 5: Single level 0 title (=) ✅
- Line 7: Blank line before short description ✅
- Line 8: `[role="_abstract"]` ✅
```
**Score:** 4 - Meets criteria

### Example 2: Product Name Validation
**Content Analysis:**
```
Text found: "Configure the {cmo-full} to monitor {product-title}"
OPL Check Results:
- {cmo-full} → "Cluster Monitoring Operator" ✅ (Full name correct)
- {product-title} → "OpenShift Container Platform" ✅ (Official product name)
- Usage context: Technical documentation ✅ (Appropriate for CMO)
```
**Score:** 4 - Meets criteria

### Example 3: Prerequisites Assessment
**Procedure Module Check:**
```
File: <procedure-file>.adoc
Line 12: "Prerequisites" ✅ (Correct label)
Content:
- "You have access to the cluster as a user with the cluster-admin role" ✅ (Describes condition)
- "You have installed the OpenShift CLI" ✅ (Describes condition)
Count: 2 prerequisites ✅ (Within 10 limit)
No imperative statements ✅ (No "Install X" or "Complete Y")
```
**Score:** 4 - Meets criteria

### Example 4: Short Description Quality
**Assessment Process:**
```
File: configurable-components.adoc
[role="_abstract"]
Learn about the monitoring components you can configure after installing the monitoring stack.

Quality Check:
- Purpose clarity: ✅ Explains why to read (shows configurable components)
- Concise language: ✅ Suitable for link preview
- SEO keywords: ✅ "monitoring components", "configure", "monitoring stack"
- No self-reference: ✅ Avoids "This document describes"
- Character count: 95 characters ✅ (Within 50-300 range)
```
**Score:** 4 - Meets criteria

