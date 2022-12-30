require('nvim-tree').setup {
    open_on_setup = true,
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = false,
    reload_on_bufenter = true,
    sync_root_with_cwd = true;
    update_focused_file = {
        enable = false,
    },
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
    },
    view = {
        mappings = {
            list = {
                { key = "l", action = "edit" },
                { key = "<CR>", action = "cd" },
                { key = "h", action = "close_node" },
                { key = "J", action = "next_sibling" },
                { key = "K", action = "prev_sibling" },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.WARN,
            max = vim.diagnostic.severity.ERROR,
        },
    },
    renderer = {
        group_empty = true,
        root_folder_modifier = ":t",
        full_name = true,
        icons = {
            glyphs = {
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    filters = {
        dotfiles = false,
        custom = {
            "^\\.DS_Store$", "\\.meta$"
        },
        exclude = {
            -- ".zshrc"
        }
    },
    log = {
        enable = true,
        truncate = true,
        types = {
            git = true,
            profile = true,
        },
    },
}
