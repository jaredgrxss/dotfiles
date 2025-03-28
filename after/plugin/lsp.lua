-- lsp.lua file


-- Initialize mason.nvim
require('mason').setup()

-- Setup mason-lspconfig
require('mason-lspconfig').setup({
    ensure_installed = { 'pyright', 'ts_ls', 'rust_analyzer', 'lua_ls', 'ruby_lsp' },
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
    { name = 'solargraph' }
  }, {
    { name = 'buffer' },
  })
})

require('nvim-autopairs').setup({})
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done()
)

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

lspconfig.ruby_lsp.setup(vim.tbl_extend("force", default_lsp_settings, {
    cmd = { "ruby-lsp" },
    init_options = {
        formatter = true,
        diagnostics = true,
        symbolInclusion = { all = true },
    },
    root_dir = lspconfig.util.root_pattern("Gemfile", ".git")
}))
