vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.ruler = true
vim.opt.wrap = false
vim.opt.sidescroll = 1
vim.opt.scroll = 1
vim.opt.sidescrolloff = 30
vim.opt.scrolloff = 12
vim.opt.colorcolumn = "120"
vim.opt.textwidth = 300

vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")
vim.cmd("syntax on")
vim.cmd("colorscheme lunaperche")

vim.opt.cindent = true
vim.opt.autoindent = true

if vim.g.neovide then
    -- TODO
end

vim.opt.guifont = "UbuntuMono Nerd Font:h12"
vim.opt.linespace = 5

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
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
})

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "tsserver",
        "clangd",
        "ltex",
        "cmake",
        "pylsp",
    }
}

--- LSP:
require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT"
            },
            diagnostics = {
                globals = {
                    "vim"
                }
            }
        }
    }
}
require("lspconfig").ltex.setup {}
require("lspconfig").tsserver.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").cmake.setup {}
require("lspconfig").pylsp.setup {}

-- test ##############################################################################################################################
--            Long Line Test
-- test ###########################################################################################################

