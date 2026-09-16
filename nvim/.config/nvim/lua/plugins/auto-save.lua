return {
  "Pocco81/auto-save.nvim",
  opts = {
    condition = function(buf)
      -- Don't auto-save while an oil.nvim window is open anywhere (any
      -- tabpage, floating or not) — oil applies pending file operations
      -- (renames, deletes, moves, etc.) on save, so auto-saving it would
      -- silently execute those changes.
      for _, b in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[b].filetype == "oil" and #vim.fn.win_findbuf(b) > 0 then
          return false
        end
      end

      local fn = vim.fn
      local utils = require("auto-save.utils.data")
      return fn.getbufvar(buf, "&modifiable") == 1
        and utils.not_in(fn.getbufvar(buf, "&filetype"), {})
    end,
  },
}
