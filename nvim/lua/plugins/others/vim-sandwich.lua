return {
  "machakann/vim-sandwich",
  lazy = false,
  init = function()
    -- vim.cmd [[  source $HOME/.local/share/nvim/lazy/vim-sandwich/macros/sandwich/keymap/surround.vim ]]
    -- See `:h g:sandwich_no_default_key_mappings`
    vim.cmd [[
	let g:sandwich_no_default_key_mappings = 1
    let g:operator_sandwich_no_default_key_mappings = 1
    let g:textobj_sandwich_no_default_key_mappings = 1

	" add
	nmap za <Plug>(sandwich-add)
	xmap za <Plug>(sandwich-add)
	omap za <Plug>(sandwich-add)

	" delete
	nmap zd <Plug>(sandwich-delete)
	xmap zd <Plug>(sandwich-delete)
	nmap zdb <Plug>(sandwich-delete-auto)

	" replace
	nmap zr <Plug>(sandwich-replace)
	xmap zr <Plug>(sandwich-replace)
	nmap zrb <Plug>(sandwich-replace-auto)

	" text-objects (if you need)
	omap ib <Plug>(textobj-sandwich-auto-i)
	xmap ib <Plug>(textobj-sandwich-auto-i)
	omap ab <Plug>(textobj-sandwich-auto-a)
	xmap ab <Plug>(textobj-sandwich-auto-a)

	omap is <Plug>(textobj-sandwich-query-i)
	xmap is <Plug>(textobj-sandwich-query-i)
	omap as <Plug>(textobj-sandwich-query-a)
	xmap as <Plug>(textobj-sandwich-query-a)
    ]]
  end
}
