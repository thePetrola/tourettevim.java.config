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

-- Dashboard personal config for TouretteVim
-----------------------------------------------------------------------dashboard--------------------------------------------------------------------------------
--#region # Theme configurations
lvim.colorscheme = "desert"

local dashboard = require "alpha.themes.dashboard"
local user_config_path = require("lvim.config"):get_user_config_path()
local imgdir = os.getenv("HOME") .. "/.config/lvim"

-- see if the dashboard image file exists
local function file_exists()
  local f = io.open(imgdir .. "/assets/dashboard_banner.txt", "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
local function lines_from(file)
  if not file_exists() then return {} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

local header = {
  type = "text",
  val = lines_from(imgdir .. "/assets/dashboard_banner.txt"),
  opts = {
    position = "center",
    hl = "Type",
  },
}

local buttons = {
    type = "group",
    val = {
      dashboard.button("n", "New File ", "<cmd>ene!<CR>"),
      dashboard.button("p", "Recent Projects ", "<cmd>Telescope projects<CR>"),
      dashboard.button("e", "Recently Used Files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("t", "Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("c", "Configuration", "<cmd>edit " .. user_config_path .. "<CR>"),
      dashboard.button("q", "Quit", "<CMD>quit<CR>" .. user_config_path .. "<CR>"),
    },
    position = "center",
}

local folow_me = {
  type = "text",
  val = lines_from(imgdir .. "/assets/dashboard_follow_me.txt"),
  opts = {
    position = "center",
    hl = "type",
  }
}

lvim.builtin.alpha.dashboard.config = {
 layout = {
    { type = "padding", val = 2 },
    header,
    { type = "padding", val = 2 },
    buttons,
    { type = "padding", val = 2 },
    folow_me,
  },
  opts = {
   margin = 7,
   setup = function()
   vim.cmd([[autocmd alpha_temp DirChanged * lua try_require('alpha').redraw()]])
   end,
  },
}
--#endregion

--------------------------------------------------- Keymaps mapping --------------------------------------------------------------------
-- Terminal
lvim.builtin.which_key.mappings["t"] = {
    name = "+Terminal",
    f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
    v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
    h = { "<cmd>2ToggleTerm size=30 direction=horizontal<cr>", "Split horizontal" },
  }
