require("nvim-tree").setup({
    view = {
        width = 30,
        side = "right"
    },
    filters = {
        dotfiles = false,
    },
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {}
    }
})
