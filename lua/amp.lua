local M = {}

local config = {
  enable_file_completion = false
}

--- Setup function to configure amp settings
---@param options { enable_file_completion: boolean? } | nil
function M.setup(options)
  options = options or {}

  -- Check if <C-x><C-f> has been remapped
  if options.enable_file_completion then
    local mapping_check = vim.fn.mapcheck('<C-x><C-f>', 'i')
    -- Auto-disable file completion if <C-x><C-f> is remapped
    config.enable_file_completion = mapping_check == ''
  end
end

function M.get_config()
  return config
end

return M
