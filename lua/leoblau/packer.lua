--t This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Using Packer:
    use({'Mofiqul/dracula.nvim',
    as = 'dracula',
    config = function()
        vim.cmd('colorscheme dracula')
    end
})

use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
}
use("nvim-treesitter/nvim-treesitter-context");
use("nvim-treesitter/playground")
use { 'mbbill/undotree' }
-- LSP zero con Mason
use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required

    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
}
}   
-- autopairs
use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
    -- lualine status bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    -- bufferline 
    use {
        'akinsho/bufferline.nvim', tag = "*", 
        requires = 'nvim-tree/nvim-web-devicons'}



end)
