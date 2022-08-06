require('nvim-tree').setup {
    open_on_setup = true,
    disable_netrw = true,
    hijack_netrw = true,
    reload_on_bufenter = true,
    update_focused_file = {
        enable = true,
        update_cwd = false,
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
                { key = { "<CR>", "<C-]>", "<2-RightMouse>" }, action = "cd" },
                { key = "h", action = "close_node" },
            },
        },
    },
    renderer = {
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
        dotfiles = true,
        custom = {
            ".DS_Store",
        },
        exclude = {
            ".gitignore"
        }
    }
}

