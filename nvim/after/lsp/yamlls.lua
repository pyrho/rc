return {
  on_attach = function(client, bufnr)
    require("nvim-navic").attach(client, bufnr)
  end,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/taskfile.json"] = "Taskfile*.yml",
        ["https://json.schemastore.org/circleciconfig.json"] = ".circleci/config.yml",
      },
    },
  },
}
