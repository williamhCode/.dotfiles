require('nvim-tree').setup {
    open_on_setup = true,
    disable_netrw = true,
    hijack_netrw = true,
    reload_on_bufenter = true,
    create_in_closed_folder = true;
    sync_root_with_cwd = true;
    update_focused_file = {
        enable = false,
    },
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        timeout = 400,
    },
    view = {
        mappings = {
            list = {
                { key = { "l", "<CR>", "o" }, action = "edit" },
                { key = "h", action = "close_node" },
            },
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
            ".DS_Store",
        },
        exclude = {
            ".gitignore"
        }
    }
}

