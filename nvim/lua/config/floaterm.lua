local M = {}

-- Variable to keep track of the floating window
local floating_win = nil

-- Function to open the floating terminal
function M.open_floating_terminal()
    print("Opening floating terminal...")  -- Debugging line
    local opts = {
        relative = 'editor',
        width = math.floor(vim.o.columns * 0.8),
        height = math.floor(vim.o.lines * 0.8),
        row = math.floor(vim.o.lines * 0.1),
        col = math.floor(vim.o.columns * 0.1),
        style = 'minimal',
        border = 'rounded',
    }

    local buf = vim.api.nvim_create_buf(false, true)
    floating_win = vim.api.nvim_open_win(buf, true, opts)
    vim.fn.termopen(vim.o.shell)
    vim.cmd('startinsert')
end

-- Function to close the floating terminal
function M.close_floating_terminal()
    if floating_win and vim.api.nvim_win_is_valid(floating_win) then
        vim.api.nvim_win_close(floating_win, true)
        floating_win = nil
    end
end

-- Function to toggle the floating terminal
function M.toggle_floating_terminal()
    if floating_win and vim.api.nvim_win_is_valid(floating_win) then
        M.close_floating_terminal()
    else
        M.open_floating_terminal()
    end
end

return M
