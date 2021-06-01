lua<<EOF
local function write_to_buf(data, bufnr)
  local new_lines = vim.split(data, '\n')

  -- check for errors
  if string.find(new_lines[#new_lines], '^# exit %d+') then
    error(string.format('failed to format with prettier: %s', data))
  end

  -- write contents
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, new_lines)
end

local callback = function(err)
  if err then
    error(err)
  end

  -- grab the contents of the buffer and add first row to match core_d's protocol
  local bufnr = vim.api.nvim_get_current_buf()
  local first_line = string.format('%s %s %s', token, vim.loop.cwd(), 'sample2.js')
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, true)
  table.insert(lines, 1, first_line)

  -- start reading the response
  local response = ''
  vim.loop.read_start(client, function(read_err, chunk)
    -- check if there was any error reading data back, if so, close the
    -- connection and report the error.
    if read_err then
      vim.loop.close(client)
      error('failed to read data from prettierd: ' .. read_err)
    end

    -- libuv will call this callback with no data and no error when it's done,
    -- so if there's data, concatenate it into the final response. Otherwise it
    -- means we're done, so invoke the `write_to_buf` to write the data back.
    if chunk then
      response = response .. chunk
    else
      vim.loop.close(client)
      write_to_buf(response, bufnr)
    end
  end)

  -- write the request
  vim.loop.write(client, table.concat(lines, '\n'))

  -- signal to the server that we're done writing the request
  vim.loop.shutdown(client)
end
EOF
