local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'eslint',
        'lua_ls',
        'powershell_es',
        'pylsp',
        'rust_analyzer',
        'terraformls',
        'jsonls',
        'yamlls',
    },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
        pylsp = function()
            require('lspconfig').pylsp.setup{}
        end,
        terraformls = function()
            require('lspconfig').terraformls.setup{}
            vim.api.nvim_create_autocmd({"BufWritePre"}, {
                pattern = {"*.tf", "*.tfvars"},
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end,
    },
})

