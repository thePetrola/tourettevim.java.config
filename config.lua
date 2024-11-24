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

--#endregion # Keymapping to run terminal
  lvim.builtin.which_key.mappings["t"] = {
    name = "+Terminal",
    f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
    v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
    h = { "<cmd>2ToggleTerm size=30 direction=horizontal<cr>", "Split horizontal" },
  }
--#endregion

--#region # Theme configurations
lvim.colorscheme = "desert"

-- Default banner theme
lvim.builtin.alpha.dashboard.section.header.val = {
"",
" .-') _                             _  .-')     ('-.   .-') _    .-') _     ('-.    ",
"(  OO) )                           ( \( -O )  _(  OO) (  OO) )  (  OO) )  _(  OO)   ",
"/     '._  .-'),-----.  ,--. ,--.   ,------. (,------./     '._ /     '._(,------.  ",
"|'--...__)( OO'  .-.  ' |  | |  |   |   /`. ' |  .---'|'--...__)|'--...__)|  .---'  ",
"'--.  .--'/   |  | |  | |  | | .-') |  /  | | |  |    '--.  .--''--.  .--'|  |      ",
"   |  |   \_) |  |\|  | |  |_|( OO )|  |_.' |(|  '--.    |  |      |  |  (|  '--.   ",
"   |  |     \ |  | |  | |  | | `-' /|  .  '.' |  .--'    |  |      |  |   |  .--'   ",
"   |  |      `'  '-'  '('  '-'(_.-' |  |\  \  |  `---.   |  |      |  |   |  `---.  ",
"   `--'        `-----'   `-----'    `--' '--' `------'   `--'      `--'   `------'  ",
"                  (`-.           _   .-')                                           ",
"                _(OO  )_        ( '.( OO )_                                         ",
"            ,--(_/   ,. \ ,-.-') ,--.   ,--.)                                       ",
"            \   \   /(__/ |  |OO)|   `.'   |                                        ",
"             \   \ /   /  |  |  \|         |                                        ",
"              \   '   /,  |  |(_/|  |'.'|  |                                        ",
"               \     /__),|  |_.'|  |   |  |                                        ",
"                \   /   (_|  |   |  |   |  |                                        ",
"                 `-'      `--'   `--'   `--'                                        ",
"",
}
--#endregion

