-- lsp.lua file

-- Initialize mason.nvim
-- require('mason').setup()

-- Setup mason-lspconfig
-- require('mason-lspconfig').setup({
--	ensure_installed = { 'pyright', 'ts_ls', 'rust_analyzer', 'lua_ls', 'solargraph', 'ruby_lsp' },
--})

-- Setup lspconfig with mason-lspconfig
--local lspconfig = require('lspconfig')


-- Configure LSP servers with mason-lspconfig
-- lspconfig.pyright.setup({})  -- Python
-- lspconfig.ts_ls.setup({})  -- JavaScript/TypeScript
-- lspconfig.rust_analyzer.setup({})  -- Rust
-- lspconfig.lua_ls.setup({})  -- Lua
-- lspconfig.solargraph.setup({
--	settings = {
--		solargraph = {
--			diagnostics = true,
--			formatting = true,
--			autoformat = true,
--		},
--	},
-- })
-- lspconfig.ruby_lsp.setup({
	-- Basic configuration
--	cmd = { 'ruby-lsp' },
-- })


-- Initialize mason.nvim
require('mason').setup()

-- Setup mason-lspconfig
require('mason-lspconfig').setup({
    ensure_installed = { 'pyright', 'ts_ls', 'rust_analyzer', 'lua_ls', 'solargraph', 'ruby_lsp' },
})

-- Import lspconfig
local lspconfig = require('lspconfig')

-- Common settings for all LSPs
local default_lsp_settings = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),  -- Enable autocompletion support
    flags = { debounce_text_changes = 150 },  -- Reduce LSP spam
}

-- 🔹 Python (pyright)
lspconfig.pyright.setup(vim.tbl_extend("force", default_lsp_settings, {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "strict",  -- Enforce stronger type checking
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",  -- Analyze the entire workspace
            },
        },
    },
}))

-- 🔹 JavaScript/TypeScript (tsserver)
lspconfig.ts_ls.setup(vim.tbl_extend("force", default_lsp_settings, {
    settings = {
        completions = { completeFunctionCalls = true },  -- Autocomplete function calls with parentheses
    },
    init_options = {
        preferences = {
            disableSuggestions = false,
            includeCompletionsForModuleExports = true,
            includeCompletionsWithInsertText = true,
        },
    },
}))

-- 🔹 Rust (rust_analyzer)
lspconfig.rust_analyzer.setup(vim.tbl_extend("force", default_lsp_settings, {
    settings = {
        ["rust-analyzer"] = {
            assist = { importEnforceGranularity = true, importPrefix = "crate" },
            cargo = { loadOutDirsFromCheck = true },
            procMacro = { enable = true },
            checkOnSave = { command = "clippy" },  -- Run Clippy for linting
        },
    },
}))

-- 🔹 Lua (lua_ls)
lspconfig.lua_ls.setup(vim.tbl_extend("force", default_lsp_settings, {
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },  -- Fix 'vim' undefined issue
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
        },
    },
}))

-- 🔹 Ruby (solargraph)
lspconfig.solargraph.setup(vim.tbl_extend("force", default_lsp_settings, {
    settings = {
        solargraph = {
            diagnostics = true,
            formatting = true,
            autoformat = true,
            completion = true,
            folding = true,
            references = true,
            hover = true,
        },
    },
}))

-- 🔹 Ruby LSP (ruby_lsp)
lspconfig.ruby_lsp.setup(vim.tbl_extend("force", default_lsp_settings, {
    cmd = { 'ruby-lsp' },  -- Ensure ruby-lsp is being called correctly
    settings = {
        rubyLsp = {
            formatter = "rubocop",  -- Use RuboCop for autoformatting
            lint = true,
            diagnostics = true,
            completion = true,
            semanticHighlighting = true,
        },
    },
}))
