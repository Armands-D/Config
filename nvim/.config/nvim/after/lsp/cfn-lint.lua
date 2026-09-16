-- cfn-lint is a plain CLI tool with no LSP/stdio mode, so it can't be
-- configured as a language server. It's now wired up as a linter via
-- nvim-lint instead — see lua/plugins/lint.lua.
--
-- This file is no longer used and is safe to delete
-- (`rm nvim/.config/nvim/after/lsp/cfn-lint.lua` in the dotfiles repo).
return {}
