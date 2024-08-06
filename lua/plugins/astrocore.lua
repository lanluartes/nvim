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
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
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
        ["L"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["H"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        ["<leader>ss"] = { ":split<cr>", desc = "Split screen horizontally" },
        ["<leader>sv"] = { ":vsplit<cr>", desc = "Split screen vertically" },

        ["<leader>te"] = { ":tabedit<cr>" },
        ["<tab>"] = { ":tabnext<cr>" },
        ["<s-tab>"] = { ":tabprev<cr>" },

        ["<leader>h"] = {
          desc = "Harpoon",
        },
        ["<leader>ha"] = {
          function() require("harpoon.mark").add_file() end,
          desc = "Add file to harpoon",
        },
        ["<leader>ho"] = {
          function() require("harpoon.ui").toggle_quick_menu() end,
          desc = "Toggle harpoon ui",
        },
        ["<leader>hr"] = {
          function() require("harpoon.ui").rm_file() end,
          desc = "Remove buffer from list",
        },
        ["<leader>hc"] = {
          function() require("harpoon.ui").clear_all() end,
          desc = "Clear all buffers",
        },
        ["<leader>h1"] = {
          function() require("harpoon.ui").nav_file(1) end,
          desc = "[Harpoon] go to file 1",
        },
        ["<leader>h2"] = {
          function() require("harpoon.ui").nav_file(2) end,
          desc = "[Harpoon] go to file 2",
        },
        ["<leader>h3"] = {
          function() require("harpoon.ui").nav_file(3) end,
          desc = "[Harpoon] go to file 3",
        },
        ["<leader>h4"] = {
          function() require("harpoon.ui").nav_file(4) end,
          desc = "[Harpoon] go to file 4",
        },
        ["<leader>h5"] = {
          function() require("harpoon.ui").nav_file(5) end,
          desc = "[Harpoon] go to file 5",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = { desc = "Buffers" },
        ["<leader>bc"] = {
          function() require("astrocore.buffer").close_all(true, true) end,
          desc = "Close all buffers except current",
        },
        ["<leader>bs"] = { desc = "Sort"},
        ["<leader>bse"] = { function() require("astrocore.buffer").sort "extension" end, desc = "By extension" },
        ["<leader>bsr"] = { function() require("astrocore.buffer").sort "unique_path" end, desc = "By relative path" },
        ["<leader>bsp"] = { function() require("astrocore.buffer").sort "full_path" end, desc = "By full path" },
        ["<leader>bsi"] = { function() require("astrocore.buffer").sort "bufnr" end, desc = "By buffer number" },
        ["<leader>bsm"] = { function() require("astrocore.buffer").sort "modified" end, desc = "By modification" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
    sessions = {
      autosave = {
        last = true,
        cwd = true,
      },

      -- Patterns to ignore when saving sessions
      ignore = {
        dirs = {}, -- working directories to ignore sessions in
        filetypes = { "gitcommit", "gitrebase" }, -- filetypes to ignore sessions
        buftypes = {}, -- buffer types to ignore sessions
      },
    },
  },
}
