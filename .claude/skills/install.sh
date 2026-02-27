#!/bin/bash
# Installation script for doc-quality-audit skill

set -e

SKILL_NAME="doc-quality-audit"
SKILL_FILE="${SKILL_NAME}.md"

echo "🔧 Installing ${SKILL_NAME} skill..."

# Determine installation directory
if [ -d ".claude/skills" ]; then
    # Project-local installation
    INSTALL_DIR=".claude/skills"
    echo "📁 Installing to project directory: ${INSTALL_DIR}"
elif [ ! -z "$1" ]; then
    # User specified directory
    INSTALL_DIR="$1/.claude/skills"
    echo "📁 Installing to specified directory: ${INSTALL_DIR}"
else
    echo "❌ Error: No .claude/skills directory found in current project."
    echo "Usage: ./install.sh [project-directory]"
    echo "Or run from within a project that has .claude/skills/"
    exit 1
fi

# Create directory if it doesn't exist
mkdir -p "${INSTALL_DIR}"

# Copy skill file
if [ -f "${SKILL_FILE}" ]; then
    cp "${SKILL_FILE}" "${INSTALL_DIR}/"
    echo "✅ Installed ${SKILL_FILE} to ${INSTALL_DIR}/"
else
    echo "❌ Error: ${SKILL_FILE} not found in current directory"
    exit 1
fi

echo ""
echo "✅ Installation complete!"
echo ""
echo "⚠️  IMPORTANT: Required Setup Steps"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1. Copy standards folder to your project:"
echo "   cp -r standards/ /path/to/your/project/"
echo ""
echo "2. ADD your product-specific OPL PDF:"
echo "   cp /path/to/your/OPL-ProductName.pdf /path/to/your/project/standards/"
echo ""
echo "   Examples:"
echo "   - OPL-OpenShift.pdf"
echo "   - OPL-RHEL.pdf"
echo "   - OPL-Ansible.pdf"
echo ""
echo "   ⚠️  This is REQUIRED for accurate product name validation!"
echo ""
echo "3. Verify setup:"
echo "   cd /path/to/your/project"
echo "   ./standards/verify-setup.sh"
echo ""
echo "📖 Usage (after setup):"
echo "   Audit all files in /path/to/docs-repo"
echo "   Audit the files in <folder>"
echo "   Audit assembly-file.adoc and its modules"
echo ""
echo "📋 For detailed requirements, see:"
echo "   standards/REQUIRED_FILES_README.md"
