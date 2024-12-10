local function exists_3f(path)
  local f = io.open(path)
  if f then
    f:close()
    return true
  else
    return nil
  end
end
local function read(path)
  if exists_3f(path) then
    local _2_ = io.open(path)
    if (nil ~= _2_) then
      local f = _2_
      local f0 = f
      local function close_handlers_12_auto(ok_13_auto, ...)
        f0:close()
        if ok_13_auto then
          return ...
        else
          return error(..., 0)
        end
      end
      local function _4_()
        local data = f0:read("*all")
        return data
      end
      return close_handlers_12_auto(_G.xpcall(_4_, (package.loaded.fennel or _G.debug or {}).traceback))
    else
      return nil
    end
  else
    return nil
  end
end
local function lines(path)
  if exists_3f(path) then
    local tbl_21_auto = {}
    local i_22_auto = 0
    for l in io.lines(path) do
      local val_23_auto = l
      if (nil ~= val_23_auto) then
        i_22_auto = (i_22_auto + 1)
        tbl_21_auto[i_22_auto] = val_23_auto
      else
      end
    end
    return tbl_21_auto
  else
    return nil
  end
end
local function write(path, data)
  local f = io.open(path, "w")
  local function close_handlers_12_auto(ok_13_auto, ...)
    f:close()
    if ok_13_auto then
      return ...
    else
      return error(..., 0)
    end
  end
  local function _10_()
    io.output(f)
    return io.write(data)
  end
  return close_handlers_12_auto(_G.xpcall(_10_, (package.loaded.fennel or _G.debug or {}).traceback))
end
return {read = read, lines = lines, write = write}
