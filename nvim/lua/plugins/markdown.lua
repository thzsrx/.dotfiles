return {
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- Use the latest release
        lazy = true,
        ft = "markdown", -- Load only for Markdown files
        dependencies = {
            -- Required dependencies
            "nvim-lua/plenary.nvim",
            -- "hrsh7th/nvim-cmp",
        },
        opts = {
            -- Workspaces should be an array/list
            workspaces = {
                {
                    name = "personal",  -- Workspace name
                    path = "/mnt/college/notes",  -- Path to your vault
                },
            },
            --[[completion = {
                nvim_cmp = true, -- If you use nvim-cmp for completion
            },]]-- 
            picker = {
                name = "telescope.nvim",
                note_mappings = {
                    new = "<C-x>",
                    insert_link = "<C-l>",
                },
                tag_mappings = {
                    tag_note = "<C-x>",
                    insert_tag = "<C-l>",
                },
            },
            ui = {
                enable = false, -- Disable additional syntax features
                update_debounce = 200, -- Update delay
                max_file_length = 5000, -- Disable UI for large files
                checkboxes = {
                    [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    ["x"] = { char = "", hl_group = "ObsidianDone" },
                    [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                    ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                    ["!"] = { char = "", hl_group = "ObsidianImportant" },
                },
            },
        },
    },
}
