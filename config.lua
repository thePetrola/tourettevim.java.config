-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

--#region # Instantiate jdtls
lvim.plugins = {
  "mfussenegger/nvim-jdtls",
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

lvim.builtin.treesitter.ensure_installed = {
  "java",
}
--#endregion

--#region
lvim.plugins = {
  "nvim-telescope/telescope-project.nvim",
}
lvim.builtin.project.active = true
--#endregion

--#region # Other config imports
require("./dashboard")
require("./keymapping")
--#endregion
