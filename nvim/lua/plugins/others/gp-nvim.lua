return {
  "robitx/gp.nvim",
  event = "VeryLazy",
  config = function()
    require("gp").setup({
        chat_model = {model = 'gpt-4', temperature = 1.1, top_p = 1 },
    })

    -- or setup with your own config (see Install > Configuration in Readme)
    -- require("gp").setup(conf)

    -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
  end
}
