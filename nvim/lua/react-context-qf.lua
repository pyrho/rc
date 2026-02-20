-- react-context-qf.lua
-- Neovim plugin to find all locations related to a React context
-- and populate the quickfix window.
--
-- Usage:
--   :ReactContext FooContext    -- search by explicit name
--   :ReactContext               -- uses word under cursor
--
-- The command strips common suffixes (Context, Provider) to derive
-- the base name, then searches for:
--   1. createContext definition
--   2. Type/interface definitions
--   3. .Provider usage in JSX
--   4. useContext() consumption
--   5. Custom hook definitions (useFoo)
--   6. Custom hook call sites (useFoo())
--   7. Imports of the context/provider/hook

local M = {}

--- Run ripgrep and return parsed quickfix entries
---@param pattern string ripgrep regex pattern
---@param cwd string working directory
---@param category string label for the match category
---@param multiline? boolean use multiline mode for cross-line patterns
---@return table[] quickfix entries
local function rg_search(pattern, cwd, category, multiline)
  local cmd = {
    "rg",
    "--vimgrep",
    "--no-heading",
    "--color=never",
    "--type-add=react:*.{ts,tsx,js,jsx}",
    "--type=react",
  }
  if multiline then
    table.insert(cmd, "-U")
  end
  table.insert(cmd, "-e")
  table.insert(cmd, pattern)
  table.insert(cmd, cwd)

  local result = vim.system(cmd, { text = true }):wait()
  local entries = {}

  if result.code == 0 and result.stdout and result.stdout ~= "" then
    for line in result.stdout:gmatch("[^\n]+") do
      -- rg --vimgrep format: file:line:col:text
      local file, lnum, col, text = line:match("^(.+):(%d+):(%d+):(.*)$")
      if file then
        table.insert(entries, {
          filename = file,
          lnum = tonumber(lnum),
          col = tonumber(col),
          text = string.format("[%s] %s", category, vim.trim(text)),
        })
      end
    end
  end

  return entries
end

--- Derive the base name from a context-related identifier.
--- e.g. "CurrentUserContext" -> "CurrentUser"
---      "useCurrentUser"     -> "CurrentUser"
---      "CurrentUserProvider" -> "CurrentUser"
---@param name string
---@return string
local function derive_base_name(name)
  local base = name
  -- Strip common prefixes/suffixes
  base = base:gsub("^use", "")
  base = base:gsub("Context$", "")
  base = base:gsub("Provider$", "")
  if base == "" then
    return name
  end
  return base
end

--- Main function: find all React context locations and populate quickfix
---@param raw_name string|nil the context name (or word under cursor)
function M.find_context(raw_name)
  local name = raw_name
  if not name or name == "" then
    name = vim.fn.expand("<cword>")
  end
  if not name or name == "" then
    vim.notify("ReactContext: no name provided and no word under cursor", vim.log.levels.WARN)
    return
  end

  local base = derive_base_name(name)
  local ctx_name = base .. "Context"
  local provider_name = base .. "Provider"
  local hook_name = "use" .. base

  -- Use git root or cwd
  local cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 or not cwd or cwd == "" then
    cwd = vim.fn.getcwd()
  end

  local all_entries = {}

  local searches = {
    -- 1a. Context creation: single-line XContext = createContext
    { pattern = base .. "(?:Context)?\\s*=\\s*createContext", category = "Definition" },
    -- 1b. Context creation: multiline (XContext =\n  createContext)
    { pattern = base .. "(?:Context)?\\s*=\\s*\\n\\s*createContext", category = "Definition", multiline = true },
    -- 2. Type/interface definition
    { pattern = "(?:type|interface)\\s+" .. base .. "(?:Context)?(?:Value|Type)?\\s*[={]", category = "Type" },
    -- 3. Provider in JSX
    { pattern = ctx_name .. "\\.Provider", category = "Provider JSX" },
    -- 4. Provider component definition
    { pattern = "(?:function|const)\\s+" .. provider_name, category = "Provider Def" },
    -- 5. useContext(XContext)
    { pattern = "useContext\\(" .. ctx_name .. "\\)", category = "useContext" },
    -- 6. Custom hook definition
    { pattern = "(?:function|const)\\s+" .. hook_name .. "(?:Context)?\\b", category = "Hook Def" },
    -- 7. Custom hook call sites
    { pattern = hook_name .. "(?:Context)?\\(", category = "Hook Usage" },
    -- 8. Imports of the context, provider, or hook
    { pattern = "import.*\\b(?:" .. ctx_name .. "|" .. provider_name .. "|" .. hook_name .. ")\\b", category = "Import" },
  }

  for _, search in ipairs(searches) do
    local entries = rg_search(search.pattern, cwd, search.category, search.multiline)
    for _, e in ipairs(entries) do
      table.insert(all_entries, e)
    end
  end

  if #all_entries == 0 then
    vim.notify(
      string.format("ReactContext: no results for '%s' (base: %s)", name, base),
      vim.log.levels.INFO
    )
    return
  end

  -- Deduplicate by file:lnum (keep first category seen)
  local seen = {}
  local deduped = {}
  for _, e in ipairs(all_entries) do
    local key = e.filename .. ":" .. e.lnum
    if not seen[key] then
      seen[key] = true
      table.insert(deduped, e)
    end
  end

  vim.fn.setqflist({}, " ", {
    title = string.format("React Context: %s", base),
    items = deduped,
  })
  vim.cmd("copen")

  vim.notify(
    string.format("ReactContext: found %d locations for '%s'", #deduped, base),
    vim.log.levels.INFO
  )
end

function M.setup()
  vim.api.nvim_create_user_command("ReactContext", function(opts)
    M.find_context(opts.args)
  end, {
    nargs = "?",
    desc = "Find all locations related to a React context and show in quickfix",
  })
end

return M
