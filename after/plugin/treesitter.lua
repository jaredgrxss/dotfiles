require'nvim-treesitter.install'.compilers = { "clang" }
require'nvim-treesitter.configs'.setup {
	ensure_installed = { "python", "javascript", "typescript", "ruby", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,

	},	
	indent = { enable = true },
}
