# USAGE local 
local local_plugins = {
  {
    "bo-banana-bread",
    dir = "~/Documents/personal/public/bo-banana-bread",
    priority = 1000,
    lazy = false,
    config = function()
      require("bo-banana-bread").setup()
      vim.cmd.colorscheme("bo-banana-bread")
    end,
  },
}

return local_plugins
