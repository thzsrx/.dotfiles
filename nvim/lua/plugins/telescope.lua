-- lua/config/telescope.lua
local M = {}

function M.setup()
    -- Setup Telescope itself
    require('telescope').setup({
        -- Optional: Add any specific Telescope configuration here
    })

    -- Get Telescope's built-in functions
    local builtin = require('telescope.builtin')

    -- Keymaps for various Telescope commands
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>pws', function()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>pWs', function()
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
end

return M

