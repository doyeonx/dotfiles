local treesitter = require("nvim-treesitter.configs")

treesitter.setup({ 
    highlight = {
        enable = true,
    },
    indent = { enable = true },
    ensure_installed = {
        "json",
        "yaml",
        "html",
        "css",
        "bash",
        "lua",
        "dockerfile",
        "gitignore",
        "query",
        "python",
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn", 
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
})
