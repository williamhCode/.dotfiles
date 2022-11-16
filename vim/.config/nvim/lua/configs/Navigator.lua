require('Navigator').setup({
    -- When you want to save the modified buffers when moving to tmux
    -- nil - Don't save (default)
    -- 'current' - Only save the current modified buffer
    -- 'all' - Save all the buffers
    auto_save = 'all',

    -- Disable navigation when tmux is zoomed in
    disable_on_zoom = false
})
