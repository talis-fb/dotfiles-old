local actions = require("telescope.actions")
local fb_actions = require("telescope._extensions.file_browser.actions")

require("telescope").setup({
    defaults = {
      mappings = {
        i = {
          -- ["<esc>"] = actions.close,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous
        },
      },
    },
    extensions = {
      file_browser = {
        theme = "ivy",
        mappings = {
          ["i"] = {
            -- your custom insert mode mappings
            ["<C-a>"] = fb_actions.create,
          },
          ["n"] = {
            --your custom normal mode mappings
            ["h"] = fb_actions.goto_parent_dir,
            ["l"] = fb_actions.change_cwd,
            ["a"] = fb_actions.create,
            ["m"] = fb_actions.move,
            ["y"] = fb_actions.copy,
            ["x"] = fb_actions.remove,
            ["r"] = fb_actions.rename,
            ["<backspace>"] = fb_actions.toggle_hidden,
          },
        },
      },
    },
  })


require("telescope").load_extension("emoji")
require("telescope").load_extension("file_browser")

-- MAPS
function api_map(mode, shortcut, command, noremap)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap=noremap, silent = true })
end


-- nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
-- nnoremap <Leader>n :lua require('telescope.builtin').git_files()<CR>
api_map('n', "<C-p>", ":lua require('telescope.builtin').git_files()<CR>", false)
api_map('n',  "<Leader>n", ":Telescope find_files<CR>", false)

api_map('n',     "<Leader>n", ":Telescope find_files<CR>", false)
api_map('',     "<C-z>", ":Telescope file_browser<CR><esc>" , false)
api_map('n',     "<Leader>ie", ":Telescope emoji<CR>" , false)

