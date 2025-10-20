return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" }, -- 预定义片段库
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",   -- LSP 补全源
            "hrsh7th/cmp-buffer",     -- 缓冲区文本补全
            "hrsh7th/cmp-path",       -- 文件路径补全
            "hrsh7th/cmp-cmdline",    -- 命令行补全
            "L3MON4D3/LuaSnip",       -- 代码片段引擎（可选但推荐）
            "saadparwaiz1/cmp_luasnip", -- LuaSnip 与 nvim-cmp 的桥接
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")  -- 如果使用 LuaSnip

            -- 补全引擎设置
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)  -- 使用 LuaSnip 展开片段
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    -- 快捷键映射
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- 向上滚动文档
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),  -- 向下滚动文档
                    ["<C-Space>"] = cmp.mapping.complete(),  -- 强制触发补全
                    ["<C-e>"] = cmp.mapping.abort(),         -- 关闭补全窗口
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- 确认选择
                    -- 切换补全项
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    -- 补全来源优先级排序
                    { name = "nvim_lsp" },     -- LSP 补全
                    { name = "luasnip" },      -- 代码片段补全（需安装 LuaSnip）
                    { name = "buffer" },       -- 当前缓冲区文本
                    { name = "path" },         -- 文件路径
                }),
            })

            -- 命令行补全配置（可选）
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = "buffer" } },
            })
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        -- lazy = false,
        -- branch = 'main',
        build = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { "nu" },

                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true
                }
            }
        end
    }
}
