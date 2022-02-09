
id = (...) -> ...

--- Write formatted string to default output
printf = (...) -> io.write string.format ...

safecall = (f) ->
  local result
  pcall -> result = f
  return result

-- try
--  do: -> print 'a'
--  catch: -> print 'c'
--  finally -> print 'b'
try = (t) ->
  -- ok, value = xpcall(t.do, errorHandler)
  ok, value = pcall(t.do)
  if ok
    t.finally! if t.finally
    return value
  else
    handled, backup_value = pcall -> t.catch value
    t.finally! if t.finally
    if handled return backup_value
    else error backup_value, 2

--- "Safe" version of `nvim_get_var()`
-- returns `nil` if the variable is not set.
get_var = (handle) -> (name) ->
  safecall -> vim.api.nvim_get_var(handle, name)

--- "Safe" version of `nvim_tabpage_get_var()`
-- returns `nil` if the variable is not set.
tabpage_get_var = (handle) -> (name) ->
  safecall -> vim.api.nvim_tabpage_get_var(handle, name)

--- "Safe" version of `nvim_win_get_var()`
-- returns `nil` if the variable is not set.
win_get_var = (handle) -> (name) ->
  safecall -> vim.api.nvim_win_get_var(handle, name)

--- curries given function into a `num_args`-ary function
-- @param func function to curry (binary or higher arity preferred)
-- @param num_args arity of `func`
curry = (num_args) -> (fn) ->
  num_args = num_args or debug.getinfo(fn, "u").nparams
  if num_args < 2 then fn
  helper = argtrace -> n ->
    if n < 1 then fn unpack flatten argtrace else
      (...) -> helper ({argtrace, ...}) (n - select("#", ...))
  helper {}, num_args

--- given an {{a}}, return an {a}
flatten = (t) ->
  ret = {}
  for _, v in ipairs t do
    if type v == 'table' then
      for _, fv in ipairs flatten v
        ret[#ret + 1] = fv
    else
      ret[#ret + 1] = v
  ret

-- --- take some tuple and return a tuple of elements in reverse order
-- --  e.g. "flipP(1,2,3)" returns 3,2,1
-- flipP = (...) ->
--   reverse_h(acc, v, (...)) ->
--     if 0 == select '#', ... then v, acc! else
--       reverse_h (-> v, acc), ...
--   reverse_h(id, ...)

concat = (tbs) ->
  acc = {}
  for _, tb in ipairs(tbs)
    for _, val in ipairs(tb)
      table.insert(acc, val)
  print(acc)
  acc = [val for _, val in ipairs(tb) for _, tb in ipairs(tbs)]
  print(acc)
  return acc

{ printf, get_var, tabpage_get_var, win_get_var
  curry, flatten, flipP, concat
}
