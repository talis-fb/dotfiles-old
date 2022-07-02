
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {'fugitive', 'fzf'}
}

-- -- https://github.com/romgrk/barbar.nvim
-- require'bufferline'.setup {
--   animation = false,
--   auto_hide = false,
--   tabpages = true,
--   closable = true,
--   clickable = true,
--   icons = true,
--   icon_custom_colors = false,
--   icon_separator_active = '▎',
--   icon_separator_inactive = '▎',
--   icon_close_tab = '',
--   icon_close_tab_modified = '●',
--   icon_pinned = '車',
--   maximum_padding = 1,
--   maximum_length = 30,
--   semantic_letters = true,
--   -- letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
--   no_name_title = 'Vazio',
-- }

require('cokeline').setup()


-- vim.api.nvim_set_keymap('n', '[cw', ':-tabmove<CR>', { noremap=noremap, silent = true })
-- vim.api.nvim_set_keymap('n', ']cw', ':+tabmove<CR>', { noremap=noremap, silent = true })

