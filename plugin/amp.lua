---Configure file completion for @ paths.
---@param opts { buffer?: number } | nil
local configure_file_completion = function(opts)
  local options = opts or {}
  local buf = options.buffer or 0
end

-- local complete_path = function()
--   -- vim.keymap.set('i', '@', complete_path, { buffer = buf, expr = true })
--   local has_cmp, cmp = pcall(require, 'cmp')
--   local has_cmp_path, _ = pcall(require, 'cmp_path')

--   vim.schedule(function()
--     if has_cmp and has_cmp_path then
--       cmp.complete({
--         config = {
--           sources = {
--             { name = 'path' },
--           },
--         },
--       })
--     else
--       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-x><C-f>', true, false, true), 'n', false)
--     end
--   end)

--   return '@'
-- end

-- Helper function for amp-agent filetype setup
local function setup_amp_agent()
  return "markdown.amp-agent", function(buf)
    -- Set up the @ path highlighting after filetype is set
    vim.api.nvim_create_autocmd("FileType", {
      buffer = buf,
      once = true,
      callback = function()
        -- Add syntax highlighting for @ paths
        vim.cmd([[syntax match ampPath /@[A-Za-z0-9._/\-]\+/ containedin=ALL]])
        vim.cmd([[highlight default link ampPath Include]])

        -- Set up file completion for @ if enabled
        local amp = require('amp')
        local config = amp.get_config()
        if config.enable_file_completion then
          configure_file_completion({ buffer = buf })
        end
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
