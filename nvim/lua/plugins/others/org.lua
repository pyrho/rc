return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
    enabled = false, -- moving to emacs
	ft = { "org" },
	dependencies = {
		"nvim-orgmode/org-bullets.nvim",
		"lukas-reineke/headlines.nvim",
	},
	config = function()
		-- Setup orgmode
		require("orgmode").setup({
			org_agenda_files = "~/orgfiles/**/*",
			org_default_notes_file = "~/orgfiles/refile.org",
			org_capture_templates = {
				r = {
					description = "Repo",
					template = "* [[%x][%(return string.match('%x', '([^/]+)$'))]]%?",
					target = "~/orgfiles/repos.org",
				},
				e = {
					description = "Event",
					subtemplates = {
						r = {
							description = "recurring",
							template = "** %?\n %T",
							target = "~/orgfiles/calendar.org",
							headline = "recurring",
						},
						o = {
							description = "one-time",
							template = "** %?\n %T",
							target = "~/orgfiles/calendar.org",
							headline = "one-time",
						},
					},
				},
			},
		})
		require("headlines").setup()
		require("org-bullets").setup()

		-- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
		-- add ~org~ to ignore_install
		-- require('nvim-treesitter.configs').setup({
		--   ensure_installed = 'all',
		--   ignore_install = { 'org' },
		-- })
	end,
}
