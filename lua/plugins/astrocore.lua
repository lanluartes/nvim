-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        scrolloff = 20,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        ["<M-h>"] = { '<Cmd>lua require("tmux").resize_left()<CR>', silent = true },
        ["<M-j>"] = { '<Cmd>lua require("tmux").resize_bottom()<CR>', silent = true },
        ["<M-k>"] = { '<Cmd>lua require("tmux").resize_top()<CR>', silent = true },
        ["<M-l>"] = { '<Cmd>lua require("tmux").resize_right()<CR>', silent = true },

        -- navigate buffer tabs
        ["L"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["H"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        ["<Leader>ss"] = { ":split<cr>", desc = "Split screen horizontally" },
        ["<Leader>sv"] = { ":vsplit<cr>", desc = "Split screen vertically" },

        -- ["<LocalLeader>yp"] = { , desc = "Split screen horizontally" },
        -- ["<LocalLeader>yd"] = { ":vsplit<cr>", desc = "Split screen vertically" },
        -- ["<LocalLeader>yd"] = { ":vsplit<cr>", desc = "Split screen vertically" },

        ["<LocalLeader>y"] = { name = "󰆏 Copy..." },
        ["<LocalLeader>yp"] = { function() vim.fn.setreg("+", vim.fn.expand "%:p:.") end, desc = "Copy file path" },
        ["<LocalLeader>yd"] = { function() vim.fn.setreg("+", vim.fn.expand "%:h") end, desc = "Copy directory path" },
        ["<LocalLeader>yf"] = { function() vim.fn.setreg("+", vim.fn.expand "%:t:r") end, desc = "Copy file name" },

        ["<Leader>te"] = { ":tabedit<cr>" },
        ["<tab>"] = { ":tabnext<cr>" },
        ["<s-tab>"] = { ":tabprev<cr>" },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
