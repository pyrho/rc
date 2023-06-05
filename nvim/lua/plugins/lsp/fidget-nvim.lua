-- Display a little widget at startup to show LSP server statuses
-- 2023-05-05 Using my branch until this gets merged.
-- use {'j-hui/fidget.nvim', config = function() require'fidget'.setup {} end}
return {
  'pyrho/fidget.nvim',
  ft = require'pyrho.helpers'.getFiletypesForLSP(),
  branch = 'feat/max-messages',
  config = function() require'fidget'.setup {} end
}
