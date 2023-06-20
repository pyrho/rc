return {
      "olimorris/persisted.nvim",
      cmd = { "SessionLoad", "SessionStart", "SessionStop" },
      config = function()
        require("persisted").setup({
          use_git_branch = true, -- create session files based on the branch of the git enabled repository
          follow_cwd = true, -- change session file name to match current working directory if it changes
          autoload = false, -- automatically load the session for the cwd on Neovim startup
          allowed_dirs = {"~/code/caribou/main-repo", "~/code/caribou/monorepo"}, -- table of dirs that the plugin will auto-save and auto-load from
          branch_separator = "@@"
        })
      end
    }
