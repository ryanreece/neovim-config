return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "j-hui/fidget.nvim",
        "lukas-reineke/lsp-format.nvim",
        "saadparwaiz1/cmp_luasnip",
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
    },
    config = function()
        -- auto-complete
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        -- probably not needed...
        -- see: https://www.reddit.com/r/neovim/comments/179syw2/reasons_to_call_vimlspprotocolmake_client/
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        -- automatically format files on buffer write
        require("lsp-format").setup {}
        local on_attach = function(client, bufnr)
            require("lsp-format").on_attach(client, bufnr)
        end

        -- unobtrusive lsp messages in the corner of the buffer
        require("fidget").setup({})

        -- package manager for lsp servers
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                'eslint',
                'lua_ls',
                'powershell_es',
                'pylsp',
                'rust_analyzer',
                'standardrb',
                'terraformls',
                'jsonls',
                'yamlls',
            },
            handlers = {
                -- default handler for all lsp servers
                -- e.g. this code will run automatically when detected file
                -- servers are attached to the current buffer
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach
                    }
                end,

                lua_ls = function()
                    require("lspconfig").lua_ls.setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.4" },
                                diagnostics = {
                                    globals = {
                                        "bit",
                                        "vim",
                                        "it",
                                        "describe",
                                        "before_each",
                                        "after_each"
                                    },
                                }
                            }
                        }
                    }
                end,
            }
        })

        -- configure how auto-complete works
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        --- configure the diagnostic pop-ups for lsp
        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                header = "",
                prefix = "",
            },
        })
    end
}
