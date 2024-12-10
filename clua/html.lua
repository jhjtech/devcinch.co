local self_closing = {"link", "br", "meta", "input"}
local function self_closing_3f(tag)
  local acc = false
  for _, v in pairs(self_closing) do
    if (v == tag) then
      acc = (acc or true)
    else
      acc = acc
    end
  end
  return acc
end
local map
local function _2_(f, tbl)
  local out = {}
  for i, v in ipairs(tbl) do
    out[i] = f(v)
  end
  return out
end
map = _2_
local map_kv
local function _3_(f, tbl)
  local out = {}
  for k, v in pairs(tbl) do
    table.insert(out, f(k, v))
  end
  return out
end
map_kv = _3_
local to_attr
local function _4_(k, v)
  if (v == true) then
    return k
  else
    return (k .. "=\"" .. v .. "\"")
  end
end
to_attr = _4_
local tag
local function _6_(tag_name, attrs)
  assert((type(attrs) == "table"), "Missing attrs table")
  local attr_str = table.concat(map_kv(to_attr, attrs), " ")
  if self_closing_3f(tag_name) then
    return ("<" .. tag_name .. " " .. attr_str .. " />")
  else
    return ("<" .. tag_name .. " " .. attr_str .. ">")
  end
end
tag = _6_
local function html(doc)
  if (type(doc) == "string") then
    return doc
  else
    local tag_name = doc[1]
    local attrs = doc[2]
    local body = (function (t, k, e) local mt = getmetatable(t) if 'table' == type(mt) and mt.__fennelrest then return mt.__fennelrest(t, k) elseif e then local rest = {} for k, v in pairs(t) do if not e[k] then rest[k] = v end end return rest else return {(table.unpack or unpack)(t, k)} end end)(doc, 3)
    local _8_
    if self_closing_3f(tag_name) then
      _8_ = ""
    else
      _8_ = ("</" .. tag_name .. ">")
    end
    return (tag(tag_name, attrs) .. table.concat(map(html, body), " ") .. _8_)
  end
end
return html
