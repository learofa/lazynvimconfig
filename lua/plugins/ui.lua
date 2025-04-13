return {
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            vim.cmd([[colorscheme gruvbox]])
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        event = "VeryLazy",
        opts = {
            options = { theme = 'gruvbox' }
        }
    }
}
