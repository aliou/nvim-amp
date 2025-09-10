vim.filetype.add({
  filename = {
    ["permissions.txt"] = "amp-permissions",
    ["message.amp.md"] = function(path, bufnr)
      return "markdown.amp-agent", function(buf)
        -- Set up the @ path highlighting after filetype is set
        vim.api.nvim_create_autocmd("FileType", {
          buffer = buf,
          once = true,
          callback = function()
            -- Add syntax highlighting for @ paths
            vim.cmd([[syntax match ampPath /@[A-Za-z0-9._/\-]\+/ containedin=ALL]])
            vim.cmd([[highlight default link ampPath Constant]])
          end,
        })
      end
    end,
  },
})
