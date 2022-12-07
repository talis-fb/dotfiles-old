local actions = require("telescope.actions")
local fb_actions = require("telescope._extensions.file_browser.actions")

require("telescope").setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
         -- ["<cr>"] = actions.select,
          ["<C-Enter>"] = actions.select_tab,
        },
        n = {
          ["q"] = actions.close,
          -- ["<cr>"] = actions.select,
          ["-"] = actions.select_horizontal,
          ["/"] = actions.select_vertical,
        }
      },
    },
    extensions = {
      file_browser = {
        theme = "ivy",
        path = "%:p:h",
        hide_parent_dir = true,
        grouped = true,
        mappings = {
          ["i"] = {
            -- your custom insert mode mappings
            ["<C-a>"] = fb_actions.create,
          },
          ["n"] = {
            --your custom normal mode mappings
            ["h"] = fb_actions.goto_parent_dir,
            ["l"] = actions.select_default,
            ["a"] = fb_actions.create,
            ["m"] = fb_actions.move,
            ["y"] = fb_actions.copy,
            ["x"] = fb_actions.remove,
            ["r"] = fb_actions.rename,
            ["<backspace>"] = fb_actions.toggle_hidden,
            ["."] = fb_actions.goto_cwd,
          },
        },
      },
      emoji = {
        mappings = {
          ["i"] = {
            -- ["<cr>"] = actions.select_default,
          },
          ["n"] = {
            -- ["<cr>"] = actions.select_default,
          }
        }
      }
    },
  })


require("telescope").load_extension("emoji")
require("telescope").load_extension("file_browser")

-- MAPS
function api_map(mode, shortcut, command, noremap)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap=noremap, silent = false })
end


-- nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
-- nnoremap <Leader>n :lua require('telescope.builtin').git_files()<CR>
api_map('n', "<C-p>", ":lua require('telescope.builtin').git_files()<CR>", false)
api_map('n',  "<Leader>.", ":Telescope find_files<CR>", false)

api_map('n',     "<C-z>", ":Telescope file_browser<CR> <ESC>" , false)
api_map('n',     "<Leader>ie", ":Telescope emoji<CR>" , false)

api_map('n',     "<Leader>g.", ":Telescope grep_string<CR>" , false)

