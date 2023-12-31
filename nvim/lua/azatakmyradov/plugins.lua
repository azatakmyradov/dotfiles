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

require("lazy").setup({
    -- the colorscheme should be available when starting Neovim
    {
        'rose-pine/neovim',
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            require('rose-pine').setup({
                disable_italics = true,
            })
            vim.cmd.colorscheme("rose-pine")
            require('azatakmyradov/plugins/colorscheme')
        end,
    },

    -- Fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        lazy = false,
        priority = 1,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-live-grep-args.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
            require('azatakmyradov/plugins/telescope')
        end,
    },

    -- Commenting support.
    { "tpope/vim-commentary", },

    -- Add, change, and delete surrounding text.
    { 'tpope/vim-surround' },

    -- Automatically add closing brackets, quotes, etc.
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.pairs').setup()
        end
    },

    -- Useful commands like :Rename and :SudoWrite.
    { 'tpope/vim-eunuch' },

    -- Jump to the last location when opening a file.
    { 'farmergreg/vim-lastplace' },

    -- Automatically create parent dirs when saving.
    { 'jessarcher/vim-heritage' },

    -- Text objects for HTML attributes.
    {
        'whatyouhide/vim-textobj-xmlattr',
        dependencies = {
            'kana/vim-textobj-user'
        }
    },

    -- Automatically set the working directory to the project root.
    {
        'airblade/vim-rooter',
        config = function()
            vim.g.rooter_manual_only = 1
            vim.cmd('Rooter')
        end,
    },

    -- Split arrays and methods onto multiple lines, or join them back up
    {
        'AndrewRadev/splitjoin.vim',
        config = function()
            vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
            vim.g.splitjoin_trailing_comma = 1
            vim.g.splitjoin_php_method_chain_full = 1
        end,
    },

    -- Automatically fix indentation when pasting code.
    {
        'sickill/vim-pasta',
        config = function()
            vim.g.pasta_disabled_filetypes = { 'fugitive' }
        end,
    },

    -- Git integration.
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
            vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
            vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
            vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
            vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
            vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
            vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
        end,
    },

    -- Git commands.
    { 'tpope/vim-fugitive', },

    -- Improved syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
        config = function()
            require('ts_context_commentstring').setup {
                enable_autocmd = false,
            }
            require('azatakmyradov/plugins/treesitter')
        end,
    },

    -- Completion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind-nvim',
        },
        config = function()
            require('azatakmyradov/plugins/cmp_snippets')
        end,
    },

    -- Language Server Protocol.
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
        },
        config = function()
            require('azatakmyradov/plugins/zero-lsp')
        end,
    },

    -- PHP Refactoring Tools
    {
        'phpactor/phpactor',
        ft = 'php',
        build = 'composer install --no-dev --optimize-autoloader',
        config = function()
            vim.keymap.set('n', '<Leader>pm', ':PhpactorContextMenu<CR>')
            vim.keymap.set('n', '<Leader>pn', ':PhpactorClassNew<CR>')
        end,
    },

    -- Emmet for VIM
    { 'mattn/emmet-vim' },

    -- Prettier
    { 'neovim/nvim-lspconfig' },
    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('azatakmyradov/plugins/null-ls')
        end
    },
    {
        'MunifTanjim/prettier.nvim',
        config = function()
            require('azatakmyradov/plugins/prettier')
        end
    },

    -- GitHub Copilot
    {
        'github/copilot.vim',

        config = function()
            vim.g.copilot_no_tab_map = true
            vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
            vim.api.nvim_set_keymap("i", "<C-;>", 'copilot#Previous()', { silent = true, expr = true })
            vim.api.nvim_set_keymap("i", "<C-'>", 'copilot#Next()', { silent = true, expr = true })
        end
    },

    -- Harpoon
    { 'ThePrimeagen/harpoon' },

    -- UndoTree
    { 'mbbill/undotree' },

    -- Lua Line
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            require('lualine').setup {
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
            }
        end,
    },

    -- Auto tag rename
    {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
        end
    },
}, {

})
