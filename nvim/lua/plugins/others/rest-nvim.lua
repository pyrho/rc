return {
  -- [This PR](https://github.com/rest-nvim/rest.nvim/pull/122) of rest.nvim introduces some nice features
  -- Until its merged, let's use that.
  'rest-nvim/rest.nvim',
  dependencies = {"nvim-lua/plenary.nvim"},
  config = function()
    require("rest-nvim").setup({
      -- Open request results in a horizontal split
      result_split_horizontal = false,

      result_split_in_place = true,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = true,
      -- Highlight request on run
      highlight = {enabled = true, timeout = 150},
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        show_http_info = true,
        show_headers = true,
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
          end
        }
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = '.env',
      custom_dynamic_variables = {},
      yank_dry_run = true
    })
  end

}
