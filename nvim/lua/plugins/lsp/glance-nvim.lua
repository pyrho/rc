return {
  'DNLHC/glance.nvim',
  ft = require'pyrho.helpers'.getFiletypesForLSP(),
  config = function()
    local glance = require('glance')
    local actions = glance.actions

    glance.setup({
      hooks = {
        before_open = function(results, open, jump, method)
          if #results == 1 then
            jump(results[1]) -- argument is optional
          else
            open(results) -- argument is optional
          end
        end
      }
    })
  end
}
