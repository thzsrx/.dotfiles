local function keymaps()
    -- Using vim.keymap.set for better compatibility
    local set_keymap = vim.keymap.set
    local opts = { noremap = true, silent = true, desc = "" }

    set_keymap("n", "<leader>oo", ":ObsidianOpen<CR>", { desc = "[O]bsidian [O]pen" })
    set_keymap("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "[O]bsidian [B]acklinks" })
    -- Uncomment below line if you need ObsidianToday
    -- set_keymap("n", "<leader>otd", ":ObsidianToday<CR>", { desc = "[O]bsidian [T]o[d]ay" })
    set_keymap("n", "<leader>otm", ":ObsidianTomorrow<CR>", { desc = "[O]bsidian [T]o[m]orrow" })
    set_keymap("n", "<leader>oyd", ":ObsidianYesterday<CR>", { desc = "[O]bsidian [Y]ester[d]ay" })
    set_keymap("n", "<leader>os", ":ObsidianSearch<CR>", { desc = "[O]bsidian [S]earch" })
end

local opts = {
    workspaces = {
        {
            name = "notes",
            path = "/mnt/college/notes",
        },
    },
    note_id_func = function(title)
        return title
    end,
    completion = {
        nvim_cmp = true,
        min_chars = 2,
    },
    attachments = {
        img_folder = "assets",
    },
    open_app_foreground = false,
}

return {
    "epwalsh/obsidian.nvim",
    version = "*",
    keys = {
        { "<leader>otd", "<cmd>ObsidianToday<cr>", desc = "[O]bsidian [T]o[d]ay" },
        { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "[O]bsidian [O]pen" },
        { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "[O]bsidian [S]earch" },
    },
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local obsidian = require("obsidian")
        obsidian.setup(opts)
        keymaps()
    end,
}
