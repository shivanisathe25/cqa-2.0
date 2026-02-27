# How to Convert to a Slash Command (Advanced)

## Current Status
✅ Works with natural language: `Audit all files in /path`
❌ Not available as: `/doc-quality-audit`

## Why It's Not a Slash Command Now

The current implementation is a **workflow instruction file** that Claude follows automatically when you ask for an audit. It doesn't require registration as a command.

---

## How to Make It a Slash Command

To make it work as `/doc-quality-audit`, you need to create an **MCP Server** or register it as a **Claude Code plugin/skill**.

---

## Option 1: MCP Server (Recommended)

### What You Need

1. **Node.js/TypeScript** or **Python** installed
2. **MCP SDK** from Anthropic
3. **Claude Code** configured to use your MCP server

### Step-by-Step Implementation

#### 1. Create MCP Server Directory

```bash
mkdir doc-quality-audit-mcp
cd doc-quality-audit-mcp
npm init -y
npm install @anthropic-ai/sdk
```

#### 2. Create Server File

**File:** `server.ts`

```typescript
import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import {
  CallToolRequestSchema,
  ListToolsRequestSchema,
} from "@modelcontextprotocol/sdk/types.js";

const server = new Server(
  {
    name: "doc-quality-audit",
    version: "2.0.0",
  },
  {
    capabilities: {
      tools: {},
    },
  }
);

// Register the audit tool
server.setRequestHandler(ListToolsRequestSchema, async () => {
  return {
    tools: [
      {
        name: "doc_quality_audit",
        description: "Perform CQA 2.1 audit on documentation files. Supports full repository, folder, or assembly-based audits.",
        inputSchema: {
          type: "object",
          properties: {
            path: {
              type: "string",
              description: "Path to documentation repository, folder, or assembly file",
            },
            mode: {
              type: "string",
              enum: ["repository", "folder", "assembly"],
              description: "Audit mode: repository (all files), folder (specific directory), or assembly (assembly + modules)",
              default: "repository"
            },
          },
          required: ["path"],
        },
      },
    ],
  };
});

// Handle tool execution
server.setRequestHandler(CallToolRequestSchema, async (request) => {
  if (request.params.name === "doc_quality_audit") {
    const { path, mode = "repository" } = request.params.arguments;

    // Return instructions for Claude to execute the audit
    return {
      content: [
        {
          type: "text",
          text: `Execute doc-quality-audit skill workflow:

Path: ${path}
Mode: ${mode}

Follow the complete CQA 2.1 assessment workflow from .claude/skills/doc-quality-audit.md:

1. Phase 0: Prerequisites Verification
   - Check all required files in standards/
   - Verify product-specific OPL PDF exists
   - Stop if critical files missing

2. Phase 1: Discovery & Planning
   - Find all .adoc files in: ${path}
   - Group by assemblies and modules
   - Load CQA 2.1 standards and templates

3. Phase 2: Batch Assessment
   - Assess against all 17 CQA requirements
   - Process files in batches with progress updates

4. Phase 3: Report Generation
   - Generate comprehensive report organized by assembly
   - Include aggregate statistics and compliance metrics

5. Phase 4: Summary
   - Report overall compliance rate
   - List critical blockers
   - Provide migration recommendation

Generate report: assessments/assessment_<name>_<date>.md`,
        },
      ],
    };
  }

  throw new Error("Unknown tool");
});

// Start server
async function main() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
  console.error("Doc Quality Audit MCP server running on stdio");
}

main().catch((error) => {
  console.error("Server error:", error);
  process.exit(1);
});
```

#### 3. Add to Claude Code Settings

**File:** `~/.claude/settings.json`

```json
{
  "mcpServers": {
    "doc-quality-audit": {
      "command": "node",
      "args": ["/path/to/doc-quality-audit-mcp/build/server.js"]
    }
  }
}
```

#### 4. Build and Test

```bash
# Build TypeScript
npx tsc

# Restart Claude Code
# The skill is now available as a tool
```

### Usage After MCP Setup

Now you can use it as a slash command:

```
/doc-quality-audit /path/to/docs
```

Or Claude will see it as an available tool and can invoke it when you ask for an audit.

---

## Option 2: Plugin/Skill Registration (Simpler)

### Using Claude Code's Plugin System

If you want it in the marketplace-style plugin system like the JTBD skills:

#### 1. Create Plugin Structure

```bash
mkdir -p ~/.claude/plugins/marketplaces/doc-quality-skills/doc-quality-audit/1.0.0
```

#### 2. Create Plugin Manifest

**File:** `~/.claude/plugins/marketplaces/doc-quality-skills/marketplace.json`

```json
{
  "name": "doc-quality-skills",
  "displayName": "Documentation Quality Skills",
  "description": "CQA 2.1 documentation quality assessment skills",
  "url": "https://your-repo-url.com/doc-quality-skills",
  "skills": [
    {
      "name": "doc-quality-audit",
      "version": "1.0.0",
      "displayName": "Doc Quality Audit",
      "description": "Comprehensive CQA 2.1 documentation audit",
      "invocationName": "doc-quality-audit"
    }
  ]
}
```

#### 3. Create Skill Package

**File:** `~/.claude/plugins/marketplaces/doc-quality-skills/doc-quality-audit/1.0.0/skill.json`

```json
{
  "name": "doc-quality-audit",
  "version": "1.0.0",
  "displayName": "Doc Quality Audit",
  "description": "Perform CQA 2.1 audit on documentation",
  "invocationName": "doc-quality-audit",
  "parameters": [
    {
      "name": "path",
      "type": "string",
      "description": "Path to documentation",
      "required": true
    }
  ],
  "promptFile": "prompt.md"
}
```

**File:** `prompt.md`

```markdown
Execute comprehensive CQA 2.1 documentation audit.

User requested audit of: {{path}}

Follow the complete workflow from .claude/skills/doc-quality-audit.md:

1. Phase 0: Prerequisites Verification
2. Phase 1: Discovery & Planning
3. Phase 2: Batch Assessment
4. Phase 3: Report Generation
5. Phase 4: Summary

Generate detailed report in assessments/ folder.
```

#### 4. Enable in Settings

**File:** `~/.claude/settings.json`

```json
{
  "enabledPlugins": {
    "doc-quality-audit@doc-quality-skills": true
  }
}
```

### Usage After Plugin Setup

```
/doc-quality-audit /path/to/docs
```

---

## Option 3: Simple Alias (Quick Hack)

If you just want a shortcut without MCP/plugin complexity:

**File:** `~/.claude/shortcuts.json` (if supported)

```json
{
  "shortcuts": {
    "/audit": "Audit all files in {{path}} following the doc-quality-audit skill workflow"
  }
}
```

Or create a bash wrapper:

```bash
#!/bin/bash
# File: ~/.local/bin/claude-audit

echo "Launching Claude Code with audit request..."
claude --prompt "Audit all files in $1"
```

Then use: `claude-audit /path/to/docs`

---

## Comparison: Natural Language vs Slash Command

| Feature | Natural Language (Current) | Slash Command |
|---------|---------------------------|---------------|
| **Setup Complexity** | ✅ None (just copy file) | ❌ Requires MCP/plugin setup |
| **Flexibility** | ✅ Any phrasing works | ⚠️ Fixed syntax |
| **User-Friendly** | ✅ Very intuitive | ⚠️ Need to remember command |
| **Maintenance** | ✅ Easy (update one file) | ❌ More complex |
| **Distribution** | ✅ Simple tar.gz | ⚠️ Need marketplace/MCP setup |
| **Team Adoption** | ✅ Zero learning curve | ⚠️ Need to teach syntax |

---

## Recommendation

**For Your Use Case:** Stick with natural language!

✅ **Pros:**
- Already works perfectly
- Zero additional setup
- Easy to share with team
- Flexible and intuitive
- Low maintenance

❌ **Slash Command Adds:**
- Complexity in setup
- Harder to distribute
- Rigid syntax
- More to maintain
- No real benefit for your workflow

---

## When to Use Slash Commands

Slash commands make sense when:
- You have **very frequent** repetitive operations
- You need **precise parameter control**
- You're building a **public marketplace skill**
- You have **complex multi-step wizards**

For documentation audits that you run occasionally on different repos, **natural language is superior**.

---

## Reference Links

- **MCP SDK:** https://github.com/anthropics/anthropic-sdk-typescript
- **Claude Code Plugins:** Check `.claude/plugins/` structure
- **Example MCP Servers:** https://github.com/modelcontextprotocol/servers

---

## Quick Test (Without Full Setup)

If you want to experiment with slash-command-like behavior:

1. Create a simple wrapper:
   ```bash
   # In your project
   echo "#!/bin/bash
   claude --prompt 'Audit all files in \$1'" > .claude/audit.sh
   chmod +x .claude/audit.sh
   ```

2. Use it:
   ```bash
   ./.claude/audit.sh /path/to/docs
   ```

This gives you the command-line feel without complex MCP setup.

---

## Summary

**Current (Natural Language):**
```
You: Audit all files in /path/to/docs
Claude: [Executes full workflow]
```

**With Slash Command:**
```
You: /doc-quality-audit /path/to/docs
Claude: [Executes full workflow]
```

**Benefit:** Slightly shorter syntax
**Cost:** Significant setup complexity, harder distribution, less flexible

**Verdict:** Natural language is better for your use case! 🎯
