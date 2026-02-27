#!/bin/bash
# Installation script for doc-quality-audit skill

set -e

SKILL_NAME="doc-quality-audit"
SKILL_FILE="${SKILL_NAME}.md"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

echo "🔧 Installing ${SKILL_NAME} skill..."

# Determine installation directory
if [ -d ".claude/skills" ]; then
    # Project-local installation
    PROJECT_DIR="$(pwd)"
    INSTALL_DIR=".claude/skills"
    echo "📁 Installing to project directory: ${INSTALL_DIR}"
elif [ ! -z "$1" ]; then
    # User specified directory
    PROJECT_DIR="$(cd "$1" && pwd)"
    INSTALL_DIR="${PROJECT_DIR}/.claude/skills"
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

# Copy standards folder automatically
if [ -d "${REPO_ROOT}/standards" ]; then
    echo "📦 Copying standards folder..."
    cp -r "${REPO_ROOT}/standards" "${PROJECT_DIR}/"
    echo "✅ Standards folder copied to ${PROJECT_DIR}/standards/"
else
    echo "⚠️  Warning: standards folder not found at ${REPO_ROOT}/standards"
    echo "   Please copy it manually"
fi

echo ""
echo "✅ Installation complete!"
echo ""
echo "⚠️  IMPORTANT: Final Required Step"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1. ADD your product-specific OPL PDF (REQUIRED):"
echo "   cp /path/to/your/OPL-ProductName.pdf ${PROJECT_DIR}/standards/"
echo ""
echo "   Examples:"
echo "   - OPL-OpenShift.pdf"
echo "   - OPL-RHEL.pdf"
echo "   - OPL-Ansible.pdf"
echo ""
echo "   ⚠️  This is REQUIRED for accurate product name validation!"
echo ""
echo "2. Verify setup:"
echo "   cd ${PROJECT_DIR}"
echo "   ./standards/verify-setup.sh"
echo ""
echo "📖 Usage (after adding OPL PDF):"
echo "   Audit all files in /path/to/docs-repo"
echo "   Audit the files in <folder>"
echo "   Audit assembly-file.adoc and its modules"
echo ""
echo "📋 For detailed requirements, see:"
echo "   ${PROJECT_DIR}/standards/REQUIRED_FILES_README.md"
