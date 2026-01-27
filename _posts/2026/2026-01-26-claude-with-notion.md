---
layout: post
comments: true
categories: 
  - claude
  - ai
---

Setting up Claude to read your Notion documentation is easy. 

1. Add Notion's MCP to claude 
    ```
claude mcp add --transport http notion https://mcp.notion.com/mcp
Added HTTP MCP server notion with URL: https://mcp.notion.com/mcp to local config
File modified: /Users/jq/.claude.json [project: /Users/jq/code/hightouch/claude_local/2026-01-wsl]
    ```
2. In a claud session, type `/mcp` to bring up the list of servers you can configure. If the newly added server isn't there, then run `/doctor` to force claude to reread the configs
3. Select the Notion server from the list and authenticate
4. That's it. You can now send Claude links to docs you want it to read
