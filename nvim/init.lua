-- init.lua

require("config.lazy")
require("config.settings")
require("config.oil")
require('config.floaterm')
require("plugins.telescope")
require("plugins.lsp")
require("plugins.colors")
-- require("plugins.render-markdown")
require("plugins.obsidian")
-- require("plugins.markdown")
require("keymaps")

-- Color scheme setup
-- Uncomment and replace "gruvbox" with your preferred color scheme if needed
-- ColorMyPencils("gruvbox")

-- local floaterm = -- To call the floating terminal function
-- Floaterm configuration
-- floaterm.open_floating_terminal()

vim.g.follow_url_func = function(url)
    os.execute("xdg-open " .. url)
end

-- Open file explorer on Neovim startup only if no file is specified
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        -- Check if no files are passed to Neovim
        if vim.fn.argc() == 0 then
            vim.cmd("Ex")  -- Open file explorer
        end
    end,
})

