local id
id = function(...)
  return ...
end
local printf
printf = function(...)
  return io.write(string.format(...))
end
local safecall
safecall = function(f)
  local result
  pcall(function()
    result = f
  end)
  return result
end
local try
try = function(t)
  local ok, value = pcall(t["do"])
  if ok then
    if t.finally then
      t.finally()
    end
    return value
  else
    local handled, backup_value = pcall(function()
      return t.catch(value)
    end)
    if t.finally then
      t.finally()
    end
    if handled then
      return backup_value
    else
      return error(backup_value, 2)
    end
  end
end
local get_var
get_var = function(handle)
  return function(name)
    return safecall(function()
      return vim.api.nvim_get_var(handle, name)
    end)
  end
end
local tabpage_get_var
tabpage_get_var = function(handle)
  return function(name)
    return safecall(function()
      return vim.api.nvim_tabpage_get_var(handle, name)
    end)
  end
end
local win_get_var
win_get_var = function(handle)
  return function(name)
    return safecall(function()
      return vim.api.nvim_win_get_var(handle, name)
    end)
  end
end
local curry
curry = function(num_args)
  return function(fn)
    num_args = num_args or debug.getinfo(fn, "u").nparams
    if num_args < 2 then
      local _ = fn
    end
    local helper = argtrace(function()
      return n(function()
        if n < 1 then
          return fn(unpack(flatten(argtrace)))
        else
          return function(...)
            return helper(({
              argtrace,
              ...
            })((n - select("#", ...))))
          end
        end
      end)
    end)
    return helper({ }, num_args)
  end
end
local flatten
flatten = function(t)
  local ret = { }
  for _, v in ipairs(t) do
    if type(v == 'table') then
      for _, fv in ipairs(flatten(v)) do
        ret[#ret + 1] = fv
      end
    else
      ret[#ret + 1] = v
    end
  end
  return ret
end
local concat
concat = function(tbs)
  local acc = { }
  for _, tb in ipairs(tbs) do
    for _, val in ipairs(tb) do
      table.insert(acc, val)
    end
  end
  print(acc)
  do
    local _accum_0 = { }
    local _len_0 = 1
    for _, val in ipairs(tb) do
      for _, tb in ipairs(tbs) do
        _accum_0[_len_0] = val
        _len_0 = _len_0 + 1
      end
    end
    acc = _accum_0
  end
  print(acc)
  return acc
end
return {
  printf,
  get_var,
  tabpage_get_var,
  win_get_var,
  curry,
  flatten,
  flipP,
  concat
}
