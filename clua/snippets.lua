local files = require("files")
local mailchimp = "<div id=\"mc_embed_shell\">\n  <link href=\"//cdn-images.mailchimp.com/embedcode/classic-061523.css\" rel=\"stylesheet\" type=\"text/css\">\n  <style type=\"text/css\">\n  #mc_embed_signup background:#fff; false;clear:left; font:14px Helvetica,Arial,sans-serif; width: 600px;}\n  /* Add your own Mailchimp form style overrides in your site stylesheet or in this style block.\n  We recommend moving this block and the preceding CSS link to the HEAD of your HTML file. */\n  </style>\n  <div id=\"mc_embed_signup\">\n  <form style=\"margin:0\" action=\"https://ltd.us10.list-manage.com/subscribe/post?u=defbb29af77e62d14937e5328&amp;id=58d8f9c678&amp;f_id=0067f7e3f0\" method=\"post\" id=\"mc-embedded-subscribe-form\" name=\"mc-embedded-subscribe-form\" class=\"validate\" target=\"_blank\">\n  <div id=\"mc_embed_signup_scroll\"></h2>\n  <div class=\"mc-field-group\"><input type=\"email\" name=\"EMAIL\" class=\"required email\" id=\"mce-EMAIL\" required=\"\" value=\"\"></div>\n  <div id=\"mce-responses\" class=\"clear foot\">\n  <div class=\"response\" id=\"mce-error-response\" style=\"display: none;\"></div>\n  <div class=\"response\" id=\"mce-success-response\" style=\"display: none;\"></div>\n  </div>\n  <div aria-hidden=\"true\" style=\"position: absolute; left: -5000px;\">\n  /* real people should not fill this in and expect good things - do not remove this or risk form bot signups */\n  <input type=\"text\" name=\"b_defbb29af77e62d14937e5328_58d8f9c678\" tabindex=\"-1\" value=\"\">\n  </div>\n  <div class=\"optionalParent\">\n  <div class=\"clear foot\" style=\"margin-top:20px;\">\n  <input type=\"submit\" name=\"subscribe\" id=\"mc-embedded-subscribe\" style=\"margin:0;width:fit-content\" value=\"Get In Touch\">\n  </div>\n  </div>\n\n  <div style=\"padding:20px;\" />\n  </div>\n  </form>\n  </div>\n  <script type=\"text/javascript\" src=\"//s3.amazonaws.com/downloads.mailchimp.com/js/mc-validate.js\"></script><script type=\"text/javascript\"> function($)  window.fnames = new Array(); window.ftypes = new Array();fnames[0]='EMAIL';ftypes[0]='email';fnames[1]='FNAME';ftypes[1]='text';fnames[2]='LNAME';ftypes[2]='text';fnames[3]='ADDRESS';ftypes[3]='address';fnames[4]='PHONE';ftypes[4]='phone';fnames[5]='BIRTHDAY';ftypes[5]='birthday';fnames[6]='COMPANY';ftypes[6]='text';}(jQuery))</script>\n"
local stripe = {"div", {}, {"script", {async = true, src = "https://js.stripe.com/v3/pricing-table.js"}}, {"stripe-pricing-table", {["pricing-table-id"] = "prctbl_1ONAmfByfLhKEshp1MgHyTtc", ["publishable-key"] = "pk_live_51NJdTqByfLhKEshpzNjQmV9nERvHTE9zzS632pwzxWBENy463c7UijEkcos5qGOhD6p26M2MvuK7429tINybwuRU006vWBC0ou"}}}
local function article_links(n)
  local cmd = string.format("ls -pat html/articles/*-preview.html | head -n %s", n)
  local ul = {"ul", {class = "dates"}}
  for v in io.popen(cmd):lines() do
    local article = string.gsub(v, "%-preview%.html", "")
    local article0 = string.gsub(article, "html%/", "")
    table.insert(ul, {"li", {style = "margin-top: 80px;"}, files.read(v), {"a", {class = "button", style = "float: right; margin-top: 20px;", href = ("/" .. article0)}, "Read more"}})
    ul = ul
  end
  return ul
end
local function article_previews(n)
  local cmd = string.format("ls -pat html/articles/*-preview.html | head -n %s", n)
  local d = ""
  for v in io.popen(cmd):lines() do
    local article = string.gsub(v, "%-preview%.html", "")
    local article0 = string.gsub(article, "html%/", "")
    d = (d .. files.read(v) .. "<div style=\"width: 100%;text-align:right;\"><a class=\"button\" href=\"/" .. article0 .. "\">Read more</a></div>")
  end
  return d
end
local testimonials = {"div", {}, {"blockquote", {}, "We and have seen value in their offerings from the beginning.\n    It was easy to get started and their detailed knowledge on backend systems has been invaluable.", {"br", {}}, {"br", {}}, {"b", {}, "James Parmley"}, {"br", {}}, {"i", {}, "Director of Engineering"}, {"br", {}}, {"b", {}, "Health Partners Group"}}}
local clients = {{url = "/pages/clients/crossref", image = "/data.jpg", title = "Crossref", summary = "Crossref metadata is open and available for reuse without restriction. There are currently 156,563,111 records, these include information about research objects like articles, grants and awards, preprints, conference papers."}, {url = "/pages/clients/bags", image = "/bags.jpg", title = "BAGS", summary = "Bookmakers Afternoon Greyhound Services Ltd provides gambling and betting services. The Company offers live and virtual greyhound racing, betting and other relevant information."}, {url = "/pages/clients/keyframesports", image = "/kfs.jpg", title = "Keyframe", summary = "Keyframe Sports provide first class video telestration software.\n    We started working with Keyframe Sports to help build their first class video telestration software and to steady their platform through a period of growth."}, {url = "/pages/clients/healthpartners", image = "/drugs.jpg", title = "Health Partners", summary = "Health Partners Group are a fmvull-service occupational health company delivering end-to-end solutions."}, {url = "/pages/clients/algorithmica", image = "/code.jpg", title = "Algorithmica", summary = "Algorithmica is an IT consultancy and service provider based in London.\n    Algorithmica is a valued partner and we have collaborated on many projects together."}, {url = "/pages/clients/abv", image = "/abv.jpg", title = "A&B Vintners", summary = "A&B Vintners is one of the UK's leading specialist wine importers."}}
local function render_clients()
  local h = {"div", {class = "row"}}
  for _, c in pairs(clients) do
    table.insert(h, {"div", {class = "col-4 col-6-medium col-12-small"}, {"section", {class = "box"}, {"a", {href = c.url, class = "image featured"}, {"img", {src = c.image}}}, {"header", {}, {"h3", {}, c.title}}, {"p", {}, c.summary}, {"footer", {}, {"ul", {class = "actions"}, {"li", {}, {"a", {href = c.url, class = "button alt"}, "Find out more"}}}}}})
    h = h
  end
  return h
end
return {mailchimp = mailchimp, ["render-clients"] = render_clients, stripe = stripe, testimonials = testimonials, ["article-links"] = article_links, ["article-previews"] = article_previews}
