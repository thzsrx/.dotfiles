return {
    "neovim/nvim-lspconfig", -- LSP configuration
    dependencies = {
        "stevearc/conform.nvim",           -- Formatter management
        "williamboman/mason.nvim",         -- LSP server manager
        "williamboman/mason-lspconfig.nvim", -- Bridges mason and lspconfig
        "hrsh7th/cmp-nvim-lsp",            -- LSP completion source for nvim-cmp
        "hrsh7th/cmp-buffer",              -- Buffer completion source for nvim-cmp
        "hrsh7th/cmp-path",                -- Path completion source for nvim-cmp
        "hrsh7th/cmp-cmdline",             -- Cmdline completion source for nvim-cmp
        "hrsh7th/nvim-cmp",                -- Autocompletion plugin
        "L3MON4D3/LuaSnip",                -- Snippet engine
        "saadparwaiz1/cmp_luasnip",        -- LuaSnip source for nvim-cmp
        "j-hui/fidget.nvim",               -- LSP progress indicator
    },

    config = function()
        -- Setup conform (for formatting)       
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                python = { "black" },
                lua = { "stylua" },
            }
        })

        -- Set up `nvim-cmp` (completion)
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force", {}, vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        -- Setup fidget (LSP progress indicator)
        require("fidget").setup()

        -- Mason setup (LSP server management)
        require("mason").setup()

        -- Setup mason-lspconfig (integration between mason and lspconfig)
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "gopls" },  -- List of LSPs to install
            handlers = {
                -- Default handler for LSP servers
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities
                    })
                end,

                -- Specific handler for Zig LSP (`zls`)
                zls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.zls.setup({
                        root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                        settings = {
                            zls = {
                                enable_inlay_hints = true,
                                enable_snippets = true,
                                warn_style = true,
                            },
                        },
                    })
                    vim.g.zig_fmt_parse_errors = 0
                    vim.g.zig_fmt_autosave = 0
                end,

                -- Specific handler for Lua LSP
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    })
                end,
            }
        })

        -- Setup nvim-cmp (completion)
        local cmp_select = { behavior = cmp.SelectBehavior.Select }


        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- LuaSnip expansion
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.confirm({ select = true }) -- Confirm if completion menu is visible
                    else
                        fallback() -- Otherwise, use the default <CR> behavior
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' }, -- LSP completion
                { name = 'luasnip' },  -- Snippet completion
            }, {
                { name = 'buffer' },   -- Buffer completion
            })
        })
        -- Diagnostic configuration (for displaying LSP diagnostics)
        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}

