-- Set the leader key
vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General Keymaps
keymap('n', '<leader>w', ":w<CR>", opts) -- Save
keymap('n', '<leader>q', ":q<CR>", opts) -- Quit

-- Telescope Keymaps
keymap('n', '<leader>ff', "<cmd>Telescope find_files<CR>", opts)
keymap('n', '<leader>fg', "<cmd>Telescope live_grep<CR>", opts)
keymap('n', '<leader>fb', "<cmd>Telescope buffers<CR>", opts)
keymap('n', '<leader>fh', "<cmd>Telescope help_tags<CR>", opts)

-- File explore
keymap('n', '<leader>e', ":Ex<CR>", opts)

-- Floating terminal
vim.api.nvim_set_keymap('n', '<leader>ft', ':lua require("config.floaterm").toggle_floating_terminal()<CR>', { noremap = true, silent = true })

-- Auto-completion Keymaps
keymap('i', '<C-p>', function() require'cmp'.select_prev_item() end, opts)  -- Previous completion item
keymap('i', '<C-n>', function() require'cmp'.select_next_item() end, opts)  -- Next completion item
keymap('i', '<C-y>', function() require'cmp'.confirm({ select = true }) end, opts)  -- Confirm completion
keymap('i', '<C-Space>', function() require'cmp'.complete() end, opts)  -- Trigger completion

-- Move to the start of the file
vim.keymap.set('n', '<leader>tt', 'gg', { noremap = true, silent = true })

-- Move to the end of the file
vim.keymap.set('n', '<leader>gg', 'G', { noremap = true, silent = true })

-- Split Windows
keymap('n', '<leader>nn', ':vsplit<CR>', opts) -- Vertical split
keymap('n', '<leader>hh', ':split<CR>', opts) -- Horizontal split
-- Resize Windows
keymap('n', '<leader>+', ':resize +5<CR>', opts)  -- Increase height
keymap('n', '<leader>-', ':resize -5<CR>', opts)  -- Decrease height
keymap('n', '<leader>/', ':vertical resize +5<CR>', opts)  -- Increase width
keymap('n', '<leader>g', ':vertical resize -5<CR>', opts)  -- Decrease width

-- Select the cursor word
keymap('n', 'aw', 'viw', opts)  -- Select the word under the cursor
-- Select the previous word
keymap('n', 'wd', 'vB', opts) -- Starts visual selection and goes to the start of the previous word
-- Select the next word
keymap('n', 'nw', 've', opts) -- Starts visual selection and goes to the end of the next word
-- Select the entire line
keymap('n', '<leader>l', 'V', opts) -- Visual mode for the entire current line
-- Select the entire file
keymap('n', '<leader>aw', 'ggVG', opts) -- Go to the start of the file, enter visual mode, and go to the end

-- System clipboard
keymap('v', '<leader>y', '"+y', opts) -- Yank the selected text to the clipboard
keymap('n', '<leader>yy', '"+Y', opts) -- Yank the entire line to the clipboard
keymap('n', '<leader>p', '"+p', opts) -- Paste below the cursor from the clipboard
keymap('n', '<leader>pp', '"+P', opts) -- Paste above the cursor from the clipboard

-- Go to the start of the line
keymap('n', '<leader>0', '^', { noremap = true, silent = true }) -- Normal mode
keymap('v', '<leader>0', '^', { noremap = true, silent = true }) -- Visual mode
keymap('i', '<C-a>', '<C-o>^', { noremap = true, silent = true }) -- Insert mode

-- Go to the end of the line
keymap('n', '<leader>4', 'g_', { noremap = true, silent = true }) -- Normal mode
keymap('v', '<leader>4', 'g_', { noremap = true, silent = true }) -- Visual mode
keymap('i', '<C-e>', '<C-o>g_', { noremap = true, silent = true }) -- Insert mode

-- Neovim's default register
keymap('v', 'ty', 'y', opts) -- Yank to Neovim's default register
keymap('n', 'yt', 'Y', opts) -- Yank the entire line to Neovim's default register
keymap('n', 'op', 'p', opts) -- Paste below the cursor from Neovim's default register
keymap('n', 'po', 'P', opts) -- Paste above the cursor from Neovim's default register

-- Move selected lines up
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Move selected lines down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Move selected lines up
vim.keymap.set("n", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Move selected lines down
vim.keymap.set("n", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Move selected lines up
vim.keymap.set("i", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Move selected lines down
vim.keymap.set("i", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Undo
keymap('n', '<leader>u', 'u', opts) -- Undo the last change
-- Redo
keymap('n', '<leader>r', '<C-r>', opts) -- Redo the undone change

-- move to specific number down --> numberj 
-- move to specific number up --> numberk 
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
return {}
