return {
    {
        "christoomey/vim-tmux-navigator", 
        lazy = false,
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            -- Optional: Add specific configuration for this color scheme
            vim.cmd.colorscheme("gruvbox")
        end,
    },   
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required dependency
        },
        config = function()
            -- Load the telescope configuration
            require('plugins.telescope').setup()  -- This will load the setup and keymaps
        end
    }
}

