local M = {}
local Job = require"plenary.job"
local helpers = require"pyrho.helpers"

function M.format(bufnr, cb)
    -- Disable
    if vim.g['pyrho#prettierd#autoformat'] == 0 then
        return
    end
    local bufnr = vim.api.nvim_get_current_buf()
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local buf_lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local cwd = vim.loop.cwd()
    -- table.insert(lines, 1, string.format('%s %s %s', state.token, cwd,
    -- helpers.ensure_path_relative_to_prefix(cwd, fname)))

    local function write_to_buf(new_lines)
        while new_lines[#new_lines] == '' do
            table.remove(new_lines, #new_lines)
        end

        if vim.tbl_isempty(new_lines) then
            return
        end

        if string.find(new_lines[#new_lines], '^# exit %d+') then
            error(string.format('failed to format with prettier: %s', data))
        end

        helpers.rewrite_wrap(function()
            local write = false
            for i, line in ipairs(new_lines) do
                if line ~= buf_lines[i] then
                    write = true
                    break
                end
            end
            if write then
                vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, new_lines)
            end

            if cb ~= nil then
                cb()
            end
        end)
    end

    local job = Job:new {
        command = "prettierd",
        args = {fname},
        writer = vim.fn.join(buf_lines, "\n"),
    }

    job:start()

    job:after_failure(function(j, code)
        vim.schedule_wrap(function()
            error(string.format('failed to format with prettier[%d]: %s', code, vim.fn.join(j:result())))
        end)()
    end)

    job:after_success(function(j, code)
        local data= j:result()
        vim.schedule_wrap(function()
            write_to_buf(data)
        end)()
    end)


end

function M.setup_autofmt(opts)
    local s = string.format([[
        augroup MyAutoFmt
            autocmd!
            autocmd BufWritePost %s lua require"pyrho.prettierd".format(function() vim.cmd("update") end)
        augroup END
    ]], vim.fn.join(opts.types, ","))

    vim.cmd (s)
end

return M
