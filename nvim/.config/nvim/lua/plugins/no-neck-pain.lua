return {
    "shortcuts/no-neck-pain.nvim",
    opts = {
        -- Measured: renders 6 columns narrower than zen-mode at the same
        -- zen_width, so compensate to keep both modes visually identical.
        width = require("config.constants").zen_width + 6,
        autocmds = { enableOnVimEnter = true },
    },
}
