-- -- lsp.lua file

-- -- Initialize mason.nvim
-- require('mason').setup()

-- -- Setup mason-lspconfig
-- require('mason-lspconfig').setup({
--     ensure_installed = { 'pyright', 'ts_ls', 'rust_analyzer', 'lua_ls', 'solargraph', 'ruby_lsp' },
-- })

-- -- Import lspconfig
-- local lspconfig = require('lspconfig')

-- -- Common settings for all LSPs
-- local default_lsp_settings = {
--     capabilities = require('cmp_nvim_lsp').default_capabilities(),  -- Enable autocompletion support
--     flags = { debounce_text_changes = 150 },  -- Reduce LSP spam
-- }

-- -- 🔹 Python (pyright)
-- lspconfig.pyright.setup(vim.tbl_extend("force", default_lsp_settings, {
--     settings = {
--         python = {
--             analysis = {
--                 typeCheckingMode = "strict",  -- Enforce stronger type checking
--                 autoSearchPaths = true,
--                 useLibraryCodeForTypes = true,
--                 diagnosticMode = "workspace",  -- Analyze the entire workspace
--             },
--         },
--     },
-- }))

-- -- 🔹 JavaScript/TypeScript (tsserver)
-- lspconfig.ts_ls.setup(vim.tbl_extend("force", default_lsp_settings, {
--     settings = {
--         completions = { completeFunctionCalls = true },  -- Autocomplete function calls with parentheses
--     },
--     init_options = {
--         preferences = {
--             disableSuggestions = false,
--             includeCompletionsForModuleExports = true,
--             includeCompletionsWithInsertText = true,
--         },
--     },
-- }))

-- -- 🔹 Rust (rust_analyzer)
-- lspconfig.rust_analyzer.setup(vim.tbl_extend("force", default_lsp_settings, {
--     settings = {
--         ["rust-analyzer"] = {
--             assist = { importEnforceGranularity = true, importPrefix = "crate" },
--             cargo = { loadOutDirsFromCheck = true },
--             procMacro = { enable = true },
--             checkOnSave = { command = "clippy" },  -- Run Clippy for linting
--         },
--     },
-- }))

-- -- 🔹 Lua (lua_ls)
-- lspconfig.lua_ls.setup(vim.tbl_extend("force", default_lsp_settings, {
--     settings = {
--         Lua = {
--             runtime = { version = "LuaJIT" },
--             diagnostics = { globals = { "vim" } },  -- Fix 'vim' undefined issue
--             workspace = { library = vim.api.nvim_get_runtime_file("", true) },
--             telemetry = { enable = false },
--         },
--     },
-- }))

-- -- 🔹 Ruby (solargraph)
-- lspconfig.solargraph.setup(vim.tbl_extend("force", default_lsp_settings, {
--     settings = {
--         solargraph = {
--             diagnostics = true,
--             formatting = true,
--             autoformat = true,
--             completion = true,
--             folding = true,
--             references = true,
--             hover = true,
--         },
--     },
-- }))

-- -- 🔹 Ruby LSP (ruby_lsp)
-- lspconfig.ruby_lsp.setup(vim.tbl_extend("force", default_lsp_settings, {
--     cmd = { 'ruby-lsp' },  -- Ensure ruby-lsp is being called correctly
--     settings = {
--         rubyLsp = {
--             formatter = "rubocop",  -- Use RuboCop for autoformatting
--             lint = true,
--             diagnostics = true,
--             completion = true,
--             semanticHighlighting = true,
--         },
--     },
-- }))


-- lsp.lua file

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

-- Code Completion Functionality
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      -- Requires LuaSnip or another snippet engine
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Autocompleting Parenthesis Setup
require('nvim-autopairs').setup({})
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done()
)

-- 🔹 Python LSP Config (pyright)
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

-- 🔹 JavaScript/TypeScript LSP Config (tsserver)
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

-- 🔹 Rust LSP Config (rust_analyzer)
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

-- 🔹 Lua LSP Config (lua_ls)
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

-- 🔹 Ruby with Solargraph LSP Config (solargraph)
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

-- 🔹 Ruby LSP Config (ruby_lsp)
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
