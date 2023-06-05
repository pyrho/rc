local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  commit = "1ead4ce8a20a8ac7e96aca038d54ceaa185be4e0",
  config = function() require("lspsaga").setup({}) end,
  dependencies = {
    {"nvim-tree/nvim-web-devicons"},
    -- Please make sure you install markdown and markdown_inline parser
    {"nvim-treesitter/nvim-treesitter"}
  }
})
--require'lspconfig'.tsserver.setup {}
