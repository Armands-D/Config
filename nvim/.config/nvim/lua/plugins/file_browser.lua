return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = {
    {
     'nvim-telescope/telescope.nvim', version = '*',
      dependencies = {
          'nvim-lua/plenary.nvim',
      }
    }
  },
  opts={},
  config = function ()
    require("telescope").setup {
      extensions = {
        file_browser = {
          browse_files = require("telescope._extensions.file_browser.finders").browse_files,
          browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
          -- disables netrw and use telescope-file-browser in its place
          hidden = { file_browser = true, folder_browser = true},
          respect_gitignore = vim.fn.executable "fd" == 1,
          files = true,
          add_dirs = true,
          depth = 2,
          no_ignore = true,
          use_fd = true,
          git_status = true,
          hijack_netrw = true,
          mappings = {
            ["i"] = {
            },
            ["n"] = {
            },
          },
        },
      },
    }
    require("telescope").load_extension "file_browser"
  end
}
