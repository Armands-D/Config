return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost", "InsertLeave" },
  config = function()
    local lint = require("lint")

    -- cfn-lint is a static, offline linter: it validates templates against
    -- bundled CloudFormation resource-provider schemas only. It never reads
    -- AWS credentials or calls out to an AWS account.
    lint.linters_by_ft = {
      yaml = { "cfn_lint" },
      json = { "cfn_lint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("nvim_lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
