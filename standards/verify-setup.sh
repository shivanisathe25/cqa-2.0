#!/bin/bash
# Verification script for doc-quality-audit skill setup
# Checks all required files are present before running audits

set -e

echo "╔════════════════════════════════════════════════════════════╗"
echo "║   Doc Quality Audit - Setup Verification                  ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

STANDARDS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ERRORS=0
WARNINGS=0

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check function
check_file() {
    local file="$1"
    local required="$2"
    local description="$3"

    if [ -f "$STANDARDS_DIR/$file" ]; then
        echo -e "${GREEN}✓${NC} $description"
        return 0
    else
        if [ "$required" = "REQUIRED" ]; then
            echo -e "${RED}✗ MISSING (REQUIRED):${NC} $description"
            echo "  Expected: $STANDARDS_DIR/$file"
            ((ERRORS++))
        else
            echo -e "${YELLOW}⚠ MISSING (OPTIONAL):${NC} $description"
            echo "  Expected: $STANDARDS_DIR/$file"
            ((WARNINGS++))
        fi
        return 1
    fi
}

echo "Checking Required Standard Files..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_file "CQA-Step-by-Step-Assessment-Guide.md" "REQUIRED" "CQA Step-by-Step Guide"
check_file "CQA 2.1 -- Content Quality Assessment_.tsv" "REQUIRED" "CQA 2.1 Assessment Matrix"
check_file "modular-docs.md" "REQUIRED" "Modular Documentation Reference"
check_file "peer-review-style.md" "REQUIRED" "Peer Review Style Guide"
check_file "Modular-documentation-templates-checklist.md" "REQUIRED" "Templates Checklist"
check_file "common-attributes.adoc" "REQUIRED" "Common Attributes File"
check_file "REQUIRED_FILES_README.md" "OPTIONAL" "Required Files Documentation"

echo ""
echo "Checking Templates Folder..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ -d "$STANDARDS_DIR/templates" ]; then
    echo -e "${GREEN}✓${NC} Templates folder exists"
    check_file "templates/TEMPLATE_ASSEMBLY_a-collection-of-modules.adoc" "REQUIRED" "  Assembly Template"
    check_file "templates/TEMPLATE_CONCEPT_concept-explanation.adoc" "REQUIRED" "  Concept Template"
    check_file "templates/TEMPLATE_PROCEDURE_doing-one-procedure.adoc" "REQUIRED" "  Procedure Template"
    check_file "templates/TEMPLATE_REFERENCE_reference-material.adoc" "REQUIRED" "  Reference Template"
else
    echo -e "${RED}✗ MISSING (REQUIRED):${NC} Templates folder"
    echo "  Expected: $STANDARDS_DIR/templates/"
    ((ERRORS++))
fi

echo ""
echo "Checking Product Naming References..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check for general OPL PDF
OPL_FOUND=0
if [ -f "$STANDARDS_DIR/OPL.pdf" ]; then
    echo -e "${GREEN}✓${NC} General OPL PDF (OPL.pdf)"
    OPL_FOUND=1
fi

# Check for product-specific OPL PDFs
PRODUCT_OPL_COUNT=$(find "$STANDARDS_DIR" -maxdepth 1 -name "OPL-*.pdf" 2>/dev/null | wc -l)

if [ $PRODUCT_OPL_COUNT -gt 0 ]; then
    echo -e "${GREEN}✓${NC} Product-specific OPL PDF(s) found ($PRODUCT_OPL_COUNT):"
    find "$STANDARDS_DIR" -maxdepth 1 -name "OPL-*.pdf" -exec basename {} \; | while read pdf; do
        echo "  - $pdf"
    done
    OPL_FOUND=1
else
    echo -e "${YELLOW}⚠ WARNING:${NC} No product-specific OPL PDF found"
    echo "  Expected naming: OPL-<product-name>.pdf"
    echo "  Example: OPL-OpenShift.pdf, OPL-RHEL.pdf"
    echo ""
    echo -e "${YELLOW}  REQUIRED ACTION:${NC}"
    echo "  1. Obtain your product's Official Product List (OPL) PDF"
    echo "  2. Save it as: $STANDARDS_DIR/OPL-<product-name>.pdf"
    echo "  3. Re-run this verification script"
    echo ""
    ((WARNINGS++))
fi

# Check for example product pages
check_file "example-cmo-product-page.md" "OPTIONAL" "Example Product Page Reference"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Summary"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}✓ All required files present!${NC}"
    echo ""
    echo "✅ READY TO RUN AUDITS"
    echo ""
    echo "Usage:"
    echo "  Audit all files in /path/to/docs-repo"
    echo "  Audit the files in folder/"
    echo "  Audit assembly-file.adoc and all its modules"
    exit 0
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}⚠ Setup complete with $WARNINGS warning(s)${NC}"
    echo ""
    echo "You can run audits, but consider addressing the warnings above."
    echo ""
    if [ $PRODUCT_OPL_COUNT -eq 0 ]; then
        echo -e "${YELLOW}IMPORTANT:${NC} Product name validation may not be accurate without"
        echo "           a product-specific OPL PDF."
    fi
    exit 0
else
    echo -e "${RED}✗ Setup incomplete - $ERRORS error(s), $WARNINGS warning(s)${NC}"
    echo ""
    echo "❌ CANNOT RUN AUDITS"
    echo ""
    echo "Please fix the errors above before running doc-quality-audit."
    echo ""
    echo "Need help? See: $STANDARDS_DIR/REQUIRED_FILES_README.md"
    exit 1
fi
