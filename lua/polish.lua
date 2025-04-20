-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

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
vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', '<Esc>', {noremap = true, silent = true})

local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  -- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Disable the statusline, tabline and cmdline while the alpha dashboard is open
-- autocmd("User", {
--   pattern = "AlphaReady",
--   desc = "disable status, tabline and cmdline for alpha",
--   callback = function()
--     vim.go.laststatus = 0
--     vim.opt.showtabline = 0
--     vim.opt.cmdheight = 0
--   end,
-- })
-- autocmd("BufUnload", {
--   buffer = 0,
--   desc = "enable status, tabline and cmdline after alpha",
--   callback = function()
--     vim.go.laststatus = 2
--     vim.opt.showtabline = 2
--     vim.opt.cmdheight = 1
--   end,
-- })
