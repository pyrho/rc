-- The legendary fuzzy finder
return {
  "junegunn/fzf.vim",
  config = function() vim.cmd("let $FZF_DEFAULT_OPTS = ''") end,
  cmd = {"Rg"},
  dependencies = {{"junegunn/fzf", build = "./install --bin"}}
}
