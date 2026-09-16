return {
  'mfussenegger/nvim-jdtls',
  dependencies = { "folke/which-key.nvim" },
  opts = function()
    local cmd = { vim.fn.exepath("jdtls") }
    if LazyVim.has("mason.nvim") then
      local lombok_jar = vim.fn.expand("$MASON/share/jdtls/lombok.jar")
      table.insert(cmd, string.format("--jvm-arg=-javaagent:%s", lombok_jar))
    end
    return {
      root_dir = function(path)
        return vim.fs.root(path, vim.lsp.config.jdtls.root_markers)
      end,
  
      -- How to find the project name for a given root dir.
      project_name = function(root_dir)
        return root_dir and vim.fs.basename(root_dir)
      end,
  
      -- Where are the config and workspace dirs for a project?
      jdtls_config_dir = function(project_name)
        return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/config"
      end,
      jdtls_workspace_dir = function(project_name)
        return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/workspace"
      end,
  
      -- How to run jdtls. This can be overridden to a full java command-line
      -- if the Python wrapper script doesn't suffice.
      cmd = cmd,
      full_cmd = function(opts)
        local fname = vim.api.nvim_buf_get_name(0)
        local root_dir = opts.root_dir(fname)
        local project_name = opts.project_name(root_dir)
        local cmd = vim.deepcopy(opts.cmd)
        if project_name then
          vim.list_extend(cmd, {
            "-configuration",
            opts.jdtls_config_dir(project_name),
            "-data",
            opts.jdtls_workspace_dir(project_name),
          })
        end
        return cmd
      end,
  
      -- These depend on nvim-dap, but can additionally be disabled by setting false here.
      dap = { hotcodereplace = "auto", config_overrides = {} },
      -- Can set this to false to disable main class scan, which is a performance killer for large project
      dap_main = {},
      test = true,
      settings = {
        java = {
          inlayHints = {
            parameterNames = {
              enabled = "all",
            },
          },
        },
      },
    }
  end
}
