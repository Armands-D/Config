return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  ---
  opts = {
    float = {
      padding = 10,
      border = 12,
    },
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    }
  },
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function(_, opts)
    require("oil").setup(opts)

    -- Grapple integration: while in an oil listing, <leader>M tags the
    -- file under the cursor (via Grapple's `path` option) instead of
    -- toggling a tag on the oil buffer itself. This overrides the global
    -- <leader>M mapping only within oil buffers (buffer-local wins).
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "oil",
      group = vim.api.nvim_create_augroup("oil_grapple", { clear = true }),
      callback = function(args)
        vim.keymap.set("n", "<leader>M", function()
          local oil = require("oil")
          local entry = oil.get_cursor_entry()
          if not entry or entry.type ~= "file" then
            vim.notify("Grapple: cursor is not on a file", vim.log.levels.WARN)
            return
          end
          local dir = oil.get_current_dir()
          require("grapple").tag({ path = dir .. entry.name })
          vim.notify("Grapple: tagged " .. entry.name, vim.log.levels.INFO)
        end, { buffer = args.buf, desc = "Grapple toggle tag (oil entry under cursor)" })
      end,
    })
  end,
}
