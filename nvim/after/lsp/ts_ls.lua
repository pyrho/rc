local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}

	local clients = vim.lsp.get_clients({ name = "ts_ls" })
	if #clients == 0 then
		vim.notify("No ts_ls client found", vim.log.levels.ERROR)
		return
	end
	local client = clients[1]
	client:exec_cmd(params)
	vim.notify("Imports sorted", vim.log.levels.INFO)
end

local vue_ls_path = vim.fn.expand("$MASON/packages/vue-language-server")
local vue_plugin_path = vue_ls_path .. "/node_modules/@vue/language-server"

return {
	on_attach = function(client, bufnr)
		require("nvim-navic").attach(client, bufnr)

		vim.api.nvim_buf_create_user_command(bufnr, "OrganizeImports", function()
			organize_imports()
		end, {
			desc = "Organize Imports",
		})
	end,
	filetypes = {
		"typescript", -- TypeScript files (.ts)
		"javascript", -- JavaScript files (.js)
		"javascriptreact", -- React files with JavaScript (.jsx)
		"typescriptreact", -- React files with TypeScript (.tsx)
		"vue", -- Vue.js single-file components (.vue)
	},
	init_options = {
		hostInfo = "neovim",
		preferences = {
			includeCompletionsForModuleExports = true,
			includeCompletionsForImportStatements = true,
			importModuleSpecifierPreference = "non-relative",
		},
		plugins = {
			{
				-- Name of the TypeScript plugin for Vue
				name = "@vue/typescript-plugin",

				-- Location of the Vue language server module (path defined in step 1)
				location = vue_plugin_path,

				-- Specify the languages the plugin applies to (in this case, Vue files)
				languages = { "vue" },
			},
		},
	},
}
