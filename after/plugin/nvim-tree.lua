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
    }
})
