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
    }
})
