return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      -- 'window.width' is the TOTAL floating window width, gutters
      -- included, but 'colorcolumn' is measured from the start of the
      -- text area. So add the current gutter width (number column +
      -- signcolumn) on top of the shared zen_width, to make the actual
      -- text area match colorcolumn exactly.
      width = function()
        local gutter = vim.opt.numberwidth:get()

        local signcolumn = vim.opt.signcolumn:get()
        local signcol_count = tonumber(signcolumn:match("yes:(%d)") or signcolumn:match("auto:(%d)"))
        if signcol_count then
          gutter = gutter + signcol_count
        elseif signcolumn == "yes" or signcolumn == "auto" then
          gutter = gutter + 1
        end

        local foldcolumn = tonumber(vim.opt.foldcolumn:get()) or 0
        gutter = gutter + foldcolumn

        return require("config.constants").zen_width + gutter
      end,
    },
  },
}
