vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        'angularjump',
        dir = '~/.config/nvim/lua/angularjump', -- Path to your local plugin
        config = function()
            -- Set up any keybindings or commands for the plugin
            vim.api.nvim_set_keymap('n', '<leader>ah', ":lua require'angularjump'.jump_to_html()<CR>",
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>ac', ":lua require'angularjump'.jump_to_css()<CR>",
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>at', ":lua require'angularjump'.jump_to_ts()<CR>",
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>as', ":lua require'angularjump'.jump_to_spec()<CR>",
                { noremap = true, silent = true })

        end
    },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                color_overrides = {
                    -- Carburetor
                    mocha = {
                        rosewater = "#42be65", -- links in help pages
                        flamingo = "#b3b3b3",  -- nvim: netrw version and telescope prompt > - GOOD
                        pink = "#b0b0b0",      -- {} - GOOD
                        mauve = "#8a8a8a",     -- py: def keyword - GOOD
                        red = "#a5a5a5",       -- js: builtin variables (console, window, JSON, etc.) - GOOD
                        maroon = "#d1d1d1",    -- py: parameters - GOOD
                        peach = "#b0b0b0",     -- lua: require() - GOOD
                        yellow = "#e0be36",    -- py: class names(?) js: constructors? nvim: warnings - GOOD
                        green = "#6b6b6b",     -- strings GOOD
                        teal = "#8b8b8b",      -- html: attributes - GOOD
                        sky = "#42be65",       -- py, js: operators - GOOD
                        sapphire = "#9c9c9c",  -- py: constructors? - GOOD
                        blue = "#9a9a9a",      -- py, js: function calls - GOOD
                        lavender = "#f4f4f4",  -- uknown
                        text = "#f4f4f4",      -- uknown
                        subtext1 = "#ff0000",  -- unknown. original: e0e0e0
                        subtext0 = "#ff0000",  -- unknown. original: c6c6c6
                        overlay2 = "#3a3a3a",  -- py, js: comments, ()[].:= - GOOD
                        overlay1 = "#ff0000",  -- unknown. original: 5e5e5e
                        overlay0 = "#6f6f6f",  -- nvim: counter in telescope ex: 230/235 - GOOD
                        surface2 = "#ff0000",  -- unknown. original: 525252
                        surface1 = "#393939",  -- nvim: line numbers - GOOD
                        surface0 = "#262626",  -- nvim: highlight line in telescope - GOOD
                        base = "#1c1c1c",      -- background - GOOD
                        mantle = "#0b0b0b",    -- vim status bar - GOOD
                        crust = "#ff0000"      -- unknown. original: 000000
                    },
                }
            })
        end
    },

    -- {
    --     'joshdick/onedark.vim',
    --     name = 'onedark',
    --     config = function()
    --         vim.cmd('colorscheme onedark')
    --     end
    -- },

    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    'theprimeagen/harpoon',

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-nvim-lua' }, -- Required
            { 'hrsh7th/cmp-buffer' },   -- Required
            { 'hrsh7th/cmp-path' },     -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },

    {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            }
        end
    },

    'unblevable/quick-scope',
    'machakann/vim-sandwich'

}

require("lazy").setup(plugins, {})
