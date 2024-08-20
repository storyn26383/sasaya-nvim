local utils = require('includes.utils')

local case = {
  unknown = -1,
  snake_space = 0, -- abc abc
  kebab = 1,       -- abc-abc
  snake_dot = 2,   -- abc.abc
  snake = 3,       -- abc_abc
  const = 4,       -- ABC_ABC
  camel = 5,       -- abcAbc
  studly = 6,      -- AbcAbc
}

---@param str string
local ucfirst = function(str)
  return str:gsub('^%l', string.upper)
end

---@param str string
local lcfirst = function(str)
  return str:gsub('^%u', string.lower)
end

---@param str string
local is_studly_case = function(str)
  local result = str:gmatch('(%u[a-z0-9]*)')

  if result == nil then
    return false
  end

  local compare = ''

  for word in result do
    compare = compare .. word
  end

  return compare == str
end

---@param str string
local is_camel_case = function(str)
  if not (str:sub(1, 1):lower() == str:sub(1, 1)) then
    return false
  end

  return is_studly_case(ucfirst(str))
end

---@param str string
local check_case = function(str)
  if str:find(' ') then
    return case.snake_space
  end

  if str:find('-') then
    return case.kebab
  end

  if str:find('%.') then
    return case.snake_dot
  end

  if str:find('_') and str:lower() == str then
    return case.snake
  end

  if str:find('_') and str:upper() == str then
    return case.const
  end

  if is_camel_case(str) then
    return case.camel
  end

  if is_studly_case(str) then
    return case.studly
  end

  return case.unknown
end

---@param str string
local explode_str = function(str)
  local is_camel_or_studly = is_camel_case(str) or is_studly_case(str)

  if is_camel_or_studly then
    str = str:gsub('(%u)', ' %1')
    str = str:gsub('(%d)', ' %1')
  end

  str = str:gsub('%.', ' ')
  str = str:gsub('-', ' ')
  str = str:gsub('_', ' ')
  str = str:gsub('%s+', ' ')
  str = str:gsub('^%s', '')

  local words = {}

  for word in str:gmatch('%S+') do
    table.insert(words, word)
  end

  return words
end

---@param str string
local studly_case = function(str)
  local words = explode_str(str)

  for i, word in ipairs(words) do
    words[i] = ucfirst(word:lower())
  end

  return table.concat(words)
end

---@param str string
local camel_case = function(str)
  str = studly_case(str)

  return lcfirst(str)
end

---@param str string
local snake_case = function(str, delimiter)
  delimiter = delimiter or '_'

  local words = explode_str(str)

  for i, word in ipairs(words) do
    words[i] = word:lower()
  end

  return table.concat(words, delimiter)
end

---@param str string
local kebab_case = function(str)
  return snake_case(str, '-')
end

---@param str string
local snake_dot_case = function(str)
  return snake_case(str, '.')
end

---@param str string
local snake_space_case = function(str)
  return snake_case(str, ' ')
end

---@param str string
local const_case = function(str)
  return snake_case(str):upper()
end

local coerce_case = function(str)
  local origin_case = check_case(str)
  local target_case = (origin_case + 1) % 7

  if target_case == case.snake_space then
    return snake_space_case(str)
  end

  if target_case == case.kebab then
    return kebab_case(str)
  end

  if target_case == case.snake_dot then
    return snake_dot_case(str)
  end

  if target_case == case.snake then
    return snake_case(str)
  end

  if target_case == case.const then
    return const_case(str)
  end

  if target_case == case.camel then
    return camel_case(str)
  end

  if target_case == case.studly then
    return studly_case(str)
  end

  return str
end

local exports = {}

--- @param options { visual: boolean }
exports.coerce_string = function(options)
  options = options or {}

  if not options.visual then
    vim.api.nvim_feedkeys('viw', 'x', false)
  end

  vim.fn.setreg('z', coerce_case(utils.get_current_selection_text()))

  vim.api.nvim_feedkeys('"zpgv', 'x', false)
end

return exports
