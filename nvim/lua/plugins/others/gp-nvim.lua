return {
  "robitx/gp.nvim",
  event = "VeryLazy",
  keys = {"<Leader>G"},
  config = function()
    require("gp").setup({
      chat_model = {model = 'gpt-4', temperature = 1.1, top_p = 1},
      command_model = { model = "gpt-4", temperature = 1.1, top_p = 1 },
      command_system_prompt = "You are an AI that strictly generates just the formatted final code.",
      hooks = {
        -- example of usig enew as a function specifying type for the new buffer
        CodeReview = function(gp, params)
          local template = "I have the following code from {{filename}}:\n\n" ..
                               "```{{filetype}}\n{{selection}}\n```\n\n" ..
                               "Please analyze for code smells and suggest improvements."
          gp.Prompt(params, gp.Target.enew("markdown"), nil,
                    gp.config.command_model, template,
                    gp.config.command_system_prompt)
        end
      }
    })

    local function keymapOptions(desc)
      return {
        noremap = true,
        silent = true,
        nowait = true,
        desc = "GPT prompt " .. desc
      }
    end

    -- Chat commands
    vim.keymap.set("n", "<Leader>G", "<cmd>GpChatToggle<cr>",
                   keymapOptions("Toggle Chat"))

    -- or setup with your own config (see Install > Configuration in Readme)
    -- require("gp").setup(conf)

    -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
  end
}
