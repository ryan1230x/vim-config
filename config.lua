-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "gruvbox"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.terminal.open_mapping = "<c-t>"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.lualine.options.theme = "gruvbox"
lvim.builtin.lualine.style = "default"


-- remove existing keymaps
lvim.builtin.which_key.mappings["gp"] = {}
lvim.builtin.which_key.mappings["gl"] = {}

-- Add custom keymaps
lvim.builtin.which_key.mappings["gp"] = { "<cmd>Git pull<cr>", "Pull" }
lvim.builtin.which_key.mappings["gP"] = { "<cmd>Git push<cr>", "Push" }
lvim.builtin.which_key.mappings["gl"] = { "<cmd>Git log<cr>", "Log" }
lvim.builtin.which_key.mappings["gi"] = { "<cmd>Git<cr>", "Git Interactive" }

lvim.builtin.which_key.mappings["m"] = {
    name = "Marks",
    a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File" },
    o = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "File Navigation" },
    n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next Mark" },
    b = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Previous Mark" },
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "javascript",
    "json",
    "typescript",
    "tsx",
    "css",
    "yaml",
    "php",
}

lvim.builtin.treesitter.highlight.enabled = true
lvim.transparent_window = false
vim.opt.relativenumber = true
vim.opt.cc = "80"
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.wildmode = "longest:full,full"
vim.opt.numberwidth = 6
vim.opt.hlsearch = false
vim.opt.shiftwidth = 4
vim.opt.termguicolors = true

-- generic LSP settings

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    {
        command = "prettierd",
        filetypes = { "typescript", "typescriptreact", "javascriptreact", "json" },
    },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    {
        command = "eslint_d",
        filetypes = { "typescript", "typescriptreact", "javascriptreact", "javascript", "json" }
    },
}

-- Additional Plugins
lvim.plugins = {
    { "lunarvim/colorschemes" },
    { "christoomey/vim-tmux-navigator" },
    { "morhetz/gruvbox" },
    { 'nvim-lua/plenary.nvim' },
    { 'ThePrimeagen/harpoon' },
    { "tpope/vim-fugitive" },
    {
        "f-person/git-blame.nvim",
        event = "BufRead",
        config = function() vim.g.gitblame_enabled = 0 end,
    },
}
