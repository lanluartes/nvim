return {
  'nvim-lualine/lualine.nvim',
  config = true,
  lazy = false,
  opts = {
    options = {
      theme = 'palenight',
      component_separators = '|',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_c = {
        {
          "filename",
          file_status = false,
          path = 1
        }
      }
    }
  }
}

