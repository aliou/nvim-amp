-- Helper function for amp-agent filetype setup
local function setup_amp_agent()
  return "markdown.amp-agent", function(buf)
    vim.api.nvim_create_autocmd("FileType", {
      buffer = buf,
      once = true,
      callback = function()
        -- Add syntax highlighting for @ paths
        vim.cmd([[syntax match ampPath /@[A-Za-z0-9._/\-]\+/ containedin=ALL]])
        vim.cmd([[highlight default link ampPath Include]])

        -- Add YAML frontmatter support with embedded syntax
        vim.cmd([[syntax include @yaml syntax/yaml.vim]])
        vim.cmd([[syntax region ampYamlFrontmatter start=/\%^---$/ end=/^---$/ contains=@yaml]])
        vim.cmd([[highlight default link ampYamlFrontmatter Comment]])

        -- Highlight glob patterns in YAML frontmatter as constants (same as @ paths)
        vim.cmd([[syntax match ampGlobPattern /'\*\*\/[^']*'/ containedin=yamlString]])
        vim.cmd([[syntax match ampGlobPattern /"\*\*\/[^"]*"/ containedin=yamlString]])
        vim.cmd([[syntax match ampGlobPattern /'[^']*\*[^']*'/ containedin=yamlString]])
        vim.cmd([[syntax match ampGlobPattern /"[^"]*\*[^"]*"/ containedin=yamlString]])
        vim.cmd([[highlight default link ampGlobPattern Include]])
      end,
    })
  end
end

vim.filetype.add({
  filename = {
    ["permissions.txt"] = "amp-permissions",
    ["message.amp.md"] = setup_amp_agent,
    ["AGENTS.md"] = setup_amp_agent,
    ["AGENT.md"] = setup_amp_agent,
  },
})
