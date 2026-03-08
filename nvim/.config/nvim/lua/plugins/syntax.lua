return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  lazy = false, -- auto update parsers
  event = { "BufEnter" },
  opts = {
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "elixir", "javascript", "html", "python", "typescript",
        "css", "sql", "json", "yaml", "markdown"
      },
  },
  config = function ()
    local treesitter = require('nvim-treesitter')
    treesitter.install(
      "c", "lua", "vim", "vimdoc", "elixir", "javascript", "html", "python", "typescript",
      "css", "sql", "json", "yaml", "markdown"
    )
  end,
}
