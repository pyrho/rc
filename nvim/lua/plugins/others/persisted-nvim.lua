return {
  "olimorris/persisted.nvim",
  enabled = false,
  cmd = {"SessionLoad", "SessionStart", "SessionStop"},
  event = "VeryLazy",
  config = function()
    require("persisted").setup({
      autosave = true,
      should_autosave = function()
        -- do not autosave if the alpha dashboard is the current filetype
        if vim.bo.filetype == "dashboard" then return false end
        return true
      end,
      use_git_branch = true, -- create session files based on the branch of the git enabled repository
      follow_cwd = true, -- change session file name to match current working directory if it changes
      autoload = false, -- automatically load the session for the cwd on Neovim startup
      -- 2023-09-27 Not sure why I did this, but I'm disabling it for now
      --allowed_dirs = {"~/code/caribou/main-repo", "~/code/caribou/monorepo"}, -- table of dirs that the plugin will auto-save and auto-load from
      branch_separator = "@@"
    })
  end
}
