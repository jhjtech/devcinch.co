(local views (require :views))

(fn health []
  (ngx.say 
    (or  
      ngx.var.arg_name
      "OK")))

(fn articles []
  (ngx.say (views.articles)))

(fn article []
  (ngx.say (views.article ngx.var.uri)))

(fn page []
  (ngx.say (views.page ngx.var.uri)))

(fn clients []
  (ngx.say (views.clients)))

(fn index []
  (ngx.say (views.index)))

{: health
 : page
 : article
 : articles
 : clients
 : index }
