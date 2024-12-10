local views = require("views")
local function health()
  return ngx.say((ngx.var.arg_name or "OK"))
end
local function articles()
  return ngx.say(views.articles())
end
local function article()
  return ngx.say(views.article(ngx.var.uri))
end
local function page()
  return ngx.say(views.page(ngx.var.uri))
end
local function clients()
  return ngx.say(views.clients())
end
local function index()
  return ngx.say(views.index())
end
return {health = health, page = page, article = article, articles = articles, clients = clients, index = index}
