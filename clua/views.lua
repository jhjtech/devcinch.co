local style = require("style")
local html = require("html")
local files = require("files")
local snippets = require("snippets")
local doctype = "<!DOCTYPE html>"
local function tchelper(first, rest)
  return (first:upper() .. rest:upper())
end
local function caps(s)
  return string.gsub(s, "(%a)([%w_']*)", tchelper)
end
local footer = {"section", {id = "footer"}, {"div", {class = "container"}, {"div", {class = "row"}, {"div", {class = "col-8 col-12-medium"}, {"section", {}, {"header", {}, {"h2", {}, "Recent Articles"}}, snippets["article-links"](10)}}, {"div", {class = "col-4 col-12-medium"}, {"section", {}, {"header", {}, {"h2", {}, "Get in touch!"}}, {"ul", {class = "contact"}, {"li", {}, {"h3", {}, "Address"}, {"p", {}, "Tividale"}, {"p", {}, "Oldbury"}, {"p", {}, "West Midlands"}, {"p", {}, "United Kingdom"}}, {"li", {}, {"h3", {}, "Phone"}, {"p", {}, "+44 7894 054 759"}}, {"li", {}, {"h3", {}, "Mail"}, {"p", {}, {"a", {href = "mailto:enquiries@jhj.ltd"}, "enquiries@jhj.ltd"}}}}}}, {"div", {class = "col-12"}, {"div", {id = "copyright"}, {"ul", {class = "links"}, {"li", {}, "&copy; JHJ Technology Limited"}, {"li", {}, "Company Number 12418911"}, {"li", {}, "Design: ", {"a", {href = "http://html5up.net"}, "HTML5 UP"}}}}}}}}
local function master(intro, body, link, title, include_banner)
  local _1_
  if title then
    _1_ = (", " .. title)
  else
    _1_ = ""
  end
  local _3_
  if (link == "/") then
    _3_ = "current"
  else
    _3_ = ""
  end
  local _5_
  if string.match(link, "%/clients") then
    _5_ = "current"
  else
    _5_ = ""
  end
  local _7_
  if string.match(link, "%/faq") then
    _7_ = "current"
  else
    _7_ = ""
  end
  local _9_
  if string.match(link, "%/articles") then
    _9_ = "current"
  else
    _9_ = ""
  end
  local _11_
  if include_banner then
    _11_ = {"section", {id = "banner"}, {"header", {}, {"h2", {style = "text-decoration:italic;"}, "Devcinch"}, {"p", {}, "Software Development as a Service - Turning Your Big Ideas into Robust Software Solutions!"}}}
  else
    _11_ = nil
  end
  return {"html", {lang = "en"}, {"head", {}, style, {"link", {rel = "stylesheet", href = "/fontawesome-all.min.css"}}, {"meta", {name = "viewport", content = "width=device-width, initial-scale=1.0"}}, {"meta", {name = "description", content = "Clojure software development and consultancy, rapid mvp, prototyping, and devops."}}, {"meta", {name = "keywords", content = ("software development, clojure consultancy, software development as a service, save money on software dev, software engineering, software dev west midlands, software engineer west midlands, software dev birmingham, software engineer birmingham, software development as a service, cheap software dev, cto co founder " .. _1_)}}, {"link", {rel = "icon", href = "/icon.png"}}, {"link", {rel = "canocical", href = link}}, {"title", {}, ("Devcinch by JHJ Technology Ltd: " .. (title or "Easy access to high quality software development"))}}, {"body", {class = "homepage is-preload"}, {"div", {id = "page-wrapper"}, {"section", {id = "header"}, {"a", {href = "/"}, {"img", {style = "margin-top:40px;", src = "/devcinch.webp"}}}, {"nav", {id = "nav"}, {"ul", {}, {"li", {class = _3_}, {"a", {href = "/"}, "Home"}}, {"li", {class = _5_}, {"a", {href = "/clients"}, "Clients"}}, {"li", {class = _7_}, {"a", {href = "/pages/faq"}, "FAQ"}}, {"li", {class = _9_}, {"a", {href = "/articles"}, "Articles"}}}}, _11_, intro}, body, footer}, {"script", {src = "/js/jquery.min.js"}}, {"script", {src = "/js/jquery.dropotron.min.js"}}, {"script", {src = "/js/browser.min.js"}}, {"script", {src = "/js/breakpoints.min.js"}}, {"script", {src = "/js/util.js"}}, {"script", {src = "/js/main.js"}}}}
end
local function articles()
  return (doctype .. html(master({"div", {}}, {"section", {id = "main"}, {"div", {class = "container"}, {"div", {class = "row"}, {"div", {class = "col-12"}, {"section", {}, {"header", {class = "major"}, {"h2", {}, "Our Articles"}}, {"section", {class = "box"}, snippets["article-previews"](1000)}}}}}}, "/articles", "Our latest articles", false)))
end
local function article(a)
  local title = caps(string.gsub(string.gsub(a, "%/articles%/", ""), "%-", " "))
  return (doctype .. html(master({"div", {}}, {"section", {id = "main"}, {"div", {class = "container"}, {"div", {class = "row"}, {"div", {class = "col-12"}, {"section", {}, {"header", {class = "major"}, {"h2", {}, title}}, {"section", {class = "box"}, files.read(("./html" .. a .. ".html"))}, {"section", {class = "box"}, {"div", {class = "col-12"}, {"section", {}, {"header", {}, {"h2", {}, "Lets Get Started!"}}, {"p", {}, "Enter your email address in the form below and let us start bringing your big ideas to life. We won't use your email address for anything else."}}, snippets.mailchimp}}}}}}}, a, title, false)))
end
local function page(a)
  local title = caps(string.gsub(string.gsub(string.gsub(a, "%/pages%/clients%/", ""), "%/pages%/", ""), "%-", " "))
  return (doctype .. html(master({"div", {}}, {"section", {id = "main"}, {"div", {class = "container"}, {"div", {class = "row"}, {"div", {class = "col-12"}, {"section", {}, {"header", {class = "major"}, {"h2", {}, title}}, {"section", {class = "box"}, files.read(("./html" .. a .. ".html"))}, {"section", {class = "box"}, {"div", {class = "col-12"}, {"section", {}, {"header", {}, {"h2", {}, "Lets Get Started!"}}, {"p", {}, "Enter your email address in the form below and let us start bringing your big ideas to life. We won't use your email address for anything else."}}, snippets.mailchimp}}}}}}}, a, title, false)))
end
local function clients()
  return (doctype .. html(master({"section", {id = "intro", class = "container"}, {"div", {class = "row"}, {"div", {class = "col-4 col-12-medium"}, {"section", {class = "first"}, {"i", {class = "icon solid featured fa-cog"}}, {"header", {}, {"h2", {}, "Clojure Consultancy"}, {"p", {}, "We have a wealth of experience when it comes to Clojure and we believe Clojure sets us apart and is our \"superpower\" for delivering robust high quality systems quickly.\n                We have worked on many \"real time\" Clojure based distributed systems across the full stack."}}}}, {"div", {class = "col-4 col-12-medium"}, {"section", {class = "middle"}, {"i", {class = "icon solid featured alt fa-users"}}, {"header", {}, {"h2", {}, "Technical Leadership"}, {"p", {}, "We stay up-to-date with the latest technology trends and offer innovative solutions that help you stay ahead of the competition."}}}}, {"div", {class = "col-4 col-12-medium"}, {"section", {class = "first"}, {"i", {class = "icon solid featured fa-hourglass-start"}}, {"header", {}, {"h2", {}, "Bootstrapping"}, {"p", {}, "Our tech stack allows for rapid iteration and short lead times, allowing you to realise and bring your ideas to market quickly."}}}}}}, {"section", {id = "main"}, {"div", {class = "container"}, {"div", {class = "row"}, {"div", {class = "col-12"}, {"section", {}, {"header", {class = "major"}, {"h2", {}, "Our Clients"}}, snippets["render-clients"]()}}}}}, "/clients", "Our Clients", false)))
end
local function index()
  return (doctype .. html(master({"section", {id = "intro", class = "container"}, {"div", {class = "row"}, {"div", {class = "col-4 col-12-medium"}, {"section", {class = "first"}, {"i", {class = "icon solid featured fa-seedling"}}, {"header", {}, {"h2", {}, "Devcinch Basic"}, {"p", {}, "Supercharge your software development with our Basic plan! Our basic plan can get you started with a developer right away!"}, {"h3", {}, "\194\1632,495 per month"}, {"ul", {style = "margin-top: 10px;"}, {"li", {class = "feature-list-item"}, "Cancel anytime"}, {"li", {class = "feature-list-item"}, "Minimum 4 Day(s) Dev /month"}, {"li", {class = "feature-list-item"}, "Async comms - email/slack etc"}}, {"a", {class = "button", href = "https://checkout.stripe.com/c/pay/cs_live_a1MM2aiknDz5FfERthviRtovStoQnrm60B4YCqnHip5jTkZZd5XciqEHng#fidkdWxOYHwnPyd1blppbHNgWjA0S09hUXRHfGNJbU5Adm11f0tvVGhTPGtAV3NNUUA8f39WMzY3dXJ%2FfVJHQEt8MTM2ZjJQbG9AbmZqdjB0QkptQTN1NzNIN0hzcE4yMTc8cUxLfGdycFdQNTUzc1JHRjVqcCcpJ3ZwZ3Zmd2x1cWxqa1BrbHRwYGtgdnZAa2RnaWBhJz9jZGl2YHgl"}, "Subscribe"}}}}, {"div", {class = "col-4 col-12-medium"}, {"section", {class = "middle"}, {"i", {class = "icon solid featured alt fa-leaf"}}, {"header", {}, {"h2", {}, "Devcinch Standard"}, {"p", {}, "Supercharge your software development with our Standard plan! Our most popular Standard plan is like having your own senior engineer!"}, {"h3", {}, "\194\1635,499 per month"}, {"ul", {style = "margin-top: 10px;"}, {"li", {class = "feature-list-item"}, "All from basic plan"}, {"li", {class = "feature-list-item"}, "Minimum 9 Day(s) Dev /month"}, {"li", {class = "feature-list-item"}, "Bring your own tools, JIRA etc"}}, {"a", {class = "button", href = "https://checkout.stripe.com/c/pay/cs_live_b1sgTc0BbfN32lVA6wvDk1Ax2IVZ0cwtDrSfHfeb9jDp9ELgScT5bNc7zu#fidkdWxOYHwnPyd1blppbHNgWjA0S09hUXRHfGNJbU5Adm11f0tvVGhTPGtAV3NNUUA8f39WMzY3dXJ%2FfVJHQEt8MTM2ZjJQbG9AbmZqdjB0QkptQTN1NzNIN0hzcE4yMTc8cUxLfGdycFdQNTUzc1JHRjVqcCcpJ3ZwZ3Zmd2x1cWxqa1BrbHRwYGtgdnZAa2RnaWBhJz9jZGl2YHgl"}, "Start Trial"}}}}, {"div", {class = "col-4 col-12-medium"}, {"section", {class = "first"}, {"i", {class = "icon solid featured fa-tree"}}, {"header", {}, {"h2", {}, "Devcinch Plus"}, {"p", {}, "Supercharge your software development with our Plus plan! Our Plus plan integrates a senior engineer into your team and workflow!"}, {"h3", {}, "\194\16311,995 per month"}, {"ul", {style = "margin-top: 10px;"}, {"li", {class = "feature-list-item"}, "All from standard plan"}, {"li", {class = "feature-list-item"}, "Minimum 20 Day(s) Dev /month"}, {"li", {class = "feature-list-item"}, "Fully integrated"}}, {"a", {class = "button", href = "https://checkout.stripe.com/c/pay/cs_live_b1joWftlENZt1O2ogB57LiKJfYW9e1NYCGO0Zr3se2s7cF6jTO8DO4nooI#fidkdWxOYHwnPyd1blppbHNgWjA0S09hUXRHfGNJbU5Adm11f0tvVGhTPGtAV3NNUUA8f39WMzY3dXJ%2FfVJHQEt8MTM2ZjJQbG9AbmZqdjB0QkptQTN1NzNIN0hzcE4yMTc8cUxLfGdycFdQNTUzc1JHRjVqcCcpJ3ZwZ3Zmd2x1cWxqa1BrbHRwYGtgdnZAa2RnaWBhJz9jZGl2YHgl"}, "Start Trial"}}}}}}, {"section", {id = "main"}, {"div", {class = "container"}, {"div", {class = "row", style = "margin-bottom:40px;"}, {"div", {class = "col-12"}, {"section", {class = "box"}, {"div", {class = "center"}, {"h3", {}, "Our unique take on Software Development, is a cinch!"}, {"p", {style = "margin-top:20px;"}, "Our subscription product Devcinch allows you access to a software developer, replacing unreliable freelancers and expensive agencies for one flat monthly fee."}, {"p", {style = "margin-top:20px;"}, "We specialise in speed of delivery and excel when working with our clients in an async nature."}, {"b", {style = "margin-top:20px;"}, "The annual cost of a full-time senior developer now exceeds \194\16365,000, that's not including benefits!\n\n                 You may not always have enough work to keep them busy and you can't easily stop paying them, not only is Devcinch cheaper over a 12 month period but you can cancel at any time!"}}}}}, {"div", {class = "row"}, {"div", {class = "col-12"}, {"section", {class = "box large-quote"}, {"div", {class = "center"}, {"blockquote", {class = "major"}, "\"Understanding the problem and coming up with great solutions is what these guys do, the team are approachable and fantastic communicators to all stakeholders and their technical expertise is second to none.\""}, {"b", {class = "major-quote-name"}, "Marcus Westgate"}}, {"div", {class = "center"}, {"i", {class = "major-quote-role"}, "Product Manager"}}}}}, {"div", {class = "row"}, {"div", {class = "col-12"}, {"section", {}, {"header", {class = "major"}, {"h2", {}, "Our Clients"}}, snippets["render-clients"]()}}}, {"div", {class = "row", style = "margin-top:40px;"}, {"div", {class = "col-12"}, {"section", {class = "box large-quote"}, {"div", {class = "center"}, {"blockquote", {class = "major"}, "\"We used JHJ to bring some additional resource into our existing engineering team and have seen value in their offerings from the beginning. It was easy to get started and their detailed knowledge on backend systems has been invaluable.\""}, {"b", {class = "major-quote-name"}, "James Parmley"}}, {"div", {class = "center"}, {"i", {class = "major-quote-role"}, "Director of Engineering"}}}}}}}, "/", "Clojure Consultancy and Bespoke Software Development", true)))
end
return {master = master, article = article, articles = articles, clients = clients, page = page, index = index}
