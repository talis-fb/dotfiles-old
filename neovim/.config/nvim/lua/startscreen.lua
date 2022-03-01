function map()
    require("startup").create_mappings(user_bookmark_mappings)
    require("startup.utils").oldfiles_mappings()
end

local settings = {
     -- every line should be same width without escaped \
    header = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 1,
        content = require('startup.headers').neovim_logo_header,
        highlight = "Statement",
        default_color = "",
        oldfiles_amount = 0,
    },
    -- name which will be displayed and command
    body = {
        type = "mapping",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = 1,
        content = {
            { " New File", "lua require'startup'.new_file('')", "a" },
            { " New File Empty", "bd", "i" },
            { " Find File", "Files", "<leader>ff" },
        },
        highlight = "String",
        default_color = "",
        oldfiles_amount = 0,
    },
    body_2 = {
         type = "oldfiles",
        oldfiles_directory = true,
        align = "center",
        fold_section = false,
        title = "",
        margin = 1,
        content = "",
        highlight = "String",
        oldfiles_amount = 7,
    },
    options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 1, 1, 0 },
    },
    mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<TAB>",
        open_help = "?",
    },
    colors = {
        background = "#1f2227",
        folded_section = "#56b6c2",
    },
    parts = { "header", "body", "body_2" },
}

require("startup").setup(settings) 

-- require("startup").create_mappings(user_bookmark_mappings)
require("startup.utils").oldfiles_mappings()
