(local views (require :views))

(fn health []
  (ngx.say 
    (or  
      ngx.var.arg_name
      "OK")))

(fn index []
  (ngx.say (views.index)))

(fn subscribed []
  (ngx.say (views.subscribed)))

{: health
 : subscribed
 : index }
