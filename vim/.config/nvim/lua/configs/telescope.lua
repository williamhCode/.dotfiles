require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-Down>"] = require('telescope.actions').cycle_history_next,
                ["<C-Up>"] = require('telescope.actions').cycle_history_prev,
            },
        },
        file_ignore_patterns = {
            ".git/",
            ".DS_Store",
        }
    },
    pickers = {
        buffers = {
            sort_lastused = true,
        },
        oldfiles = {
            cwd_only = true,
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        -- frecency = {
        --     default_workspace = 'CWD',
        --     ignore_patterns = {
        --         ".git/",
        --         ".DS_Store"
        --     }
        -- }
    }
}

require('telescope').load_extension('fzf')
-- require('telescope').load_extension('frecency')
