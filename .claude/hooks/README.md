# Claude Code hooks (optional)

Hooks are **disabled by default** in `.claude/settings.json` (`"hooks": {}`).

## Sample: block edits on main

`block-edit-on-main.sh` denies `Edit` and `Write` tool calls when the current git branch is `main` or `master`. This mirrors the feature-branch rule in `AGENTS.md`. It is a local backstop, not a substitute for branch protection and CI.

### Enable

Add this block to `.claude/settings.json` (merge with existing keys):

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "${CLAUDE_PROJECT_DIR}/.claude/hooks/block-edit-on-main.sh"
          }
        ]
      }
    ]
  }
}
```

Ensure the script is executable:

```bash
chmod +x .claude/hooks/block-edit-on-main.sh
```

Requires `jq` on your PATH.

### Disable

Remove the `PreToolUse` entry or set `"hooks": {}` again. Restart the Claude Code session if hooks do not reload.

### Adapt

Teams may fork the script for different default branches or softer warnings. Keep hooks transparent and documented; do not move governance rules out of `AGENTS.md`.
