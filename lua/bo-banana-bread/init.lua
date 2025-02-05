local M = {}

-- [1] DEFINE ALL COLORS HERE (NO EXTERNAL FILES)
local colors = {
  global_bg = "#121212",
  editor_bg = "#212121",
  foreground = "#b3b3b3",
  error = "#FF5555",
  green = "#1DB954",
  purple = "#BD93F9",
  cyan = "##8BE9FD",
  pink = "#FF79C6",
  yellow = "#F1FA8C",
  orange = "#FFB86C",
  comment = "#5d6a7f",
  terminal = {
    bg = "#121212",
    fg = "#FFFFFF",
    ansiGreen = "#1DB954",
    ansiWhite = "#FFFFFF",
    brightWhite = "#FFFFFF"
  }
}

-- [2] CORE SETUP FUNCTION
function M.setup()
  vim.g.colors_name = "bo-banana-bread"

  -- Enable true colors
  vim.opt.termguicolors = true

  -- [A] Set global background EVERYWHERE
  vim.api.nvim_set_hl(0, "Normal", { fg = colors.foreground, bg = colors.global_bg })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.global_bg })  -- Floating windows
  vim.api.nvim_set_hl(0, "StatusLine", { bg = colors.global_bg })   -- Status bar
  vim.api.nvim_set_hl(0, "TabLine", { bg = colors.global_bg })      -- Inactive tabs
  vim.api.nvim_set_hl(0, "LineNr", { fg = colors.purple })
  vim.api.nvim_set_hl(0, "RelativeLineNr", { fg = colors.purple })


  -- [B] Syntax highlights (mapped from your colors.json)
  vim.api.nvim_set_hl(0, "Comment", { fg = colors.comment, italic = true })
  vim.api.nvim_set_hl(0, "String", { fg = colors.yellow })
  vim.api.nvim_set_hl(0, "Function", { fg = colors.green })
  vim.api.nvim_set_hl(0, "Keyword", { fg = colors.pink })
  vim.api.nvim_set_hl(0, "Error", { fg = colors.error, undercurl = true })

  -- [C] Tree-sitter specific groups
  vim.api.nvim_set_hl(0, "@function", { link = "Function" })
  vim.api.nvim_set_hl(0, "@parameter", { fg = colors.orange, italic = true })
  vim.api.nvim_set_hl(0, "@string", { link = "String" })
  vim.api.nvim_set_hl(0, "@keyword", { link = "Keyword" })

  -- [D] Terminal colors (critical for your requirements)
  vim.g.terminal_color_2 = colors.terminal.ansiGreen    -- Green
  vim.g.terminal_color_7 = colors.terminal.ansiWhite    -- White
  vim.g.terminal_color_15 = colors.terminal.brightWhite -- Bright White
  vim.api.nvim_set_hl(0, "Terminal", {
    fg = colors.terminal.fg,
    bg = colors.terminal.bg
  })

  -- [E] Force global background
  vim.cmd("autocmd ColorScheme * highlight Normal guibg="..colors.global_bg)
  vim.cmd("autocmd ColorScheme * highlight NormalFloat guibg="..colors.global_bg)

end

return M
