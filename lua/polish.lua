if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Disable the statusline, tabline and cmdline while the alpha dashboard is open
autocmd('User', {
  pattern = 'AlphaReady',
  desc = 'disable status, tabline and cmdline for alpha',
  callback = function()
	  vim.go.laststatus = 0
          vim.opt.showtabline = 0
	  vim.opt.cmdheight = 0
  end,
  })
autocmd('BufUnload', {
  buffer = 0,
  desc = 'enable status, tabline and cmdline after alpha',
  callback = function()
          vim.go.laststatus = 2
          vim.opt.showtabline = 2
	  vim.opt.cmdheight = 1
  end,
  })
