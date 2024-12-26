function ColorMyPencils(color)
    -- Default to "rose-pine-moon" if no color is specified
    color = color or "rose-pine-moon"

    -- Apply the colorscheme
    vim.cmd.colorscheme(color)

    -- Apply transparent background
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- Special configuration for gruvbox
    if color == "gruvbox" then
        require("gruvbox").setup({
            terminal_colors = true,
            undercurl = true,
            underline = false,
            bold = true,
            italic = {
                strings = false,
                emphasis = false,
                comments = false,
                operators = false,
                folds = false,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true,
            contrast = "", -- Can be "hard", "soft", or empty string
            palette_overrides = {},
            overrides = {
                Normal = { bg = "none" }, -- Ensures transparency
                NormalFloat = { bg = "none" }, -- Transparent floating windows
            },
            dim_inactive = false,
            transparent_mode = true, -- Enable transparent mode
        })
        vim.cmd.colorscheme("gruvbox") -- Reapply gruvbox to load settings
    end
end
