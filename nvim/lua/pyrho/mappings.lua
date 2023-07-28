local M = {}

function M.init()
  -- Movement
  vim.api.nvim_set_keymap("n", "<Leader>h", ":wincmd h<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>j", ":wincmd j<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>k", ":wincmd k<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>l", ":wincmd l<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>w", ":wa<CR>",
                          {noremap = true, silent = true})

  -- Quickfix/Location nav
  vim.api.nvim_set_keymap("n", "[q", ":cprev<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "]q", ":cnext<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "[l", ":lprev<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "]l", ":lnext<CR>",
                          {noremap = true, silent = true})

  -- Helpers
  vim.api.nvim_set_keymap("n", "<Localleader>k",
                          "<cmd>.!toilet -w80 -f pagga -F border<CR>Vjjjj:center<CR>",
                          {noremap = true, silent = true})

  -- Tabs
  vim.api.nvim_set_keymap("n", "te", "<cmd>tab split<CR>", {noremap = true})
  vim.api.nvim_set_keymap("n", "tc", "<cmd>tabclose<CR>", {noremap = true})

  vim.cmd [[ 
    function s:vertopen_url()
        let mycommand = "reader " . shellescape('<cWORD>')
        execute "vertical terminal " . mycommand
    endfunction
    noremap <Plug>vertopen_url : call <SID>vertopen_url()<CR>
    nmap <Leader>gx <Plug>vertopen_url
  ]]

  -- Include "dumb" motions in jumplist
  -- See https://medium.com/@kadek/understanding-vims-jump-list-7e1bfc72cdf0
  vim.api.nvim_set_keymap("n", "k",
                          [[(v:count > 1 ? "m'" . v:count : '' ) . 'gk']],
                          {noremap = true, expr = true})
  vim.api.nvim_set_keymap("n", "j",
                          [[(v:count > 1 ? "m'" . v:count : '' ) . 'gj']],
                          {noremap = true, expr = true})

end

local map = vim.api.nvim_buf_set_keymap
function M.configureForLspSaga()
  -- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
  map(0, "n", "gx", "<cmd>Lspsaga code_action<cr>",
      {silent = true, noremap = true})
  map(0, "n", "K", "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true})

  map(0, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>",
      {silent = true, noremap = true})
  map(0, "n", "gO", "<cmd>Lspsaga show_cursor_diagnostics<cr>",
      {silent = true, noremap = true})

  -- map(0, "n", "gd", "<cmd>Lspsaga goto_definition<cr>",
  --     {silent = true, noremap = true})
  --
  map(0, "n", "gp", "<cmd>Lspsaga peek_definition<cr>",
      {silent = true, noremap = true})
  --
  -- map(0, "n", "gr", "<cmd>Lspsaga lsp_finder<cr>",
  --     {silent = true, noremap = true})
  --
  -- map(0, "n", "gy", "<cmd>Telescope lsp_type_definitions<cr>",
  --     {silent = true, noremap = true})

  -- map(0, "n", "g0", "<cmd>Lspsaga outline<cr>",
  --     {silent = true, noremap = true})

  -- map(0, "n", "gS",
  --     "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
  --     {silent = true, noremap = true})

end

function M.configureForGlance()
  map(0, "n", "gd", "<cmd>Glance definitions<cr>",
      {silent = true, noremap = true})

  map(0, "n", "gr", "<cmd>Glance references<cr>",
      {silent = true, noremap = true})

  map(0, "n", "gy", "<cmd>Glance type_definitions<cr>",
      {silent = true, noremap = true})
end

function M.configureMappings()
  M.configureForTrouble()
  M.configureForGlance()
end

function M.configureForTrouble()
  vim.keymap.set("n", "gj", function()
      vim.diagnostic.goto_next()
  end, {silent = true, noremap = true})

  vim.keymap.set("n", "gk", function()
      vim.diagnostic.goto_prev()
  end, {silent = true, noremap = true})

  vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
                 {silent = true, noremap = true})
  vim.keymap.set("n", "<leader>xw",
                 "<cmd>TroubleToggle workspace_diagnostics<cr>",
                 {silent = true, noremap = true})
  vim.keymap.set("n", "<leader>xd",
                 "<cmd>TroubleToggle document_diagnostics<cr>",
                 {silent = true, noremap = true})

  vim.keymap.set("n", "gx",
                 "<cmd>FzfLua lsp_code_actions<cr>",
                 {silent = true, noremap = true})
  -- vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  --                {silent = true, noremap = true})
  -- vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  --                {silent = true, noremap = true})
  -- vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>",
  --                {silent = true, noremap = true})
  -- vim.keymap.set("n", "gd", "<cmd>TroubleToggle lsp_definitions<cr>",
  --                {silent = true, noremap = true})
  -- vim.keymap.set("n", "gy", "<cmd>TroubleToggle lsp_type_definitions<cr>",
  --                {silent = true, noremap = true})
  -- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>",
  --                {silent = true, noremap = true})

end

local function find_config_file()
  local opts = {
    search_dirs = {
      require('plenary.path'):new(vim.env.HOME, 'rc', 'nvim'):absolute()
    }
  }

  require('telescope.builtin').find_files(opts)
end

function M.dashboard()
  vim.keymap.set('n', 'q', ':q<CR>', {buffer = true})
  vim.keymap.set('n', 'e', ':enew<CR>', {buffer = true})
  vim.keymap.set('n', '0', '<cmd>SessionLoad<CR>', {buffer = true})
  vim.keymap.set('n', 'c', find_config_file, {buffer = true})
  vim.keymap.set('n', 's', "<CMD>FzfLua live_grep<CR>", {buffer = true})
  vim.keymap.set('n', 'o', "<CMD>FzfLua files<CR>", {buffer = true})
  vim.keymap.set('n', 'O', "<CMD>FzfLua oldfiles<CR>", {buffer = true})
end

return M
