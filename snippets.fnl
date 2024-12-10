(local files (require :files))
(local mailchimp
  "<div id=\"mc_embed_shell\">
  <link href=\"//cdn-images.mailchimp.com/embedcode/classic-061523.css\" rel=\"stylesheet\" type=\"text/css\">
  <style type=\"text/css\">
  #mc_embed_signup background:#fff; false;clear:left; font:14px Helvetica,Arial,sans-serif; width: 600px;}
  /* Add your own Mailchimp form style overrides in your site stylesheet or in this style block.
  We recommend moving this block and the preceding CSS link to the HEAD of your HTML file. */
  </style>
  <div id=\"mc_embed_signup\">
  <form style=\"margin:0\" action=\"https://ltd.us10.list-manage.com/subscribe/post?u=defbb29af77e62d14937e5328&amp;id=58d8f9c678&amp;f_id=0067f7e3f0\" method=\"post\" id=\"mc-embedded-subscribe-form\" name=\"mc-embedded-subscribe-form\" class=\"validate\" target=\"_blank\">
  <div id=\"mc_embed_signup_scroll\"></h2>
  <div class=\"mc-field-group\"><input type=\"email\" name=\"EMAIL\" class=\"required email\" id=\"mce-EMAIL\" required=\"\" value=\"\"></div>
  <div id=\"mce-responses\" class=\"clear foot\">
  <div class=\"response\" id=\"mce-error-response\" style=\"display: none;\"></div>
  <div class=\"response\" id=\"mce-success-response\" style=\"display: none;\"></div>
  </div>
  <div aria-hidden=\"true\" style=\"position: absolute; left: -5000px;\">
  /* real people should not fill this in and expect good things - do not remove this or risk form bot signups */
  <input type=\"text\" name=\"b_defbb29af77e62d14937e5328_58d8f9c678\" tabindex=\"-1\" value=\"\">
  </div>
  <div class=\"optionalParent\">
  <div class=\"clear foot\" style=\"margin-top:20px;\">
  <input type=\"submit\" name=\"subscribe\" id=\"mc-embedded-subscribe\" style=\"margin:0;width:fit-content\" value=\"Get In Touch\">
  </div>
  </div>

  <div style=\"padding:20px;\" />
  </div>
  </form>
  </div>
  <script type=\"text/javascript\" src=\"//s3.amazonaws.com/downloads.mailchimp.com/js/mc-validate.js\"></script><script type=\"text/javascript\"> function($)  window.fnames = new Array(); window.ftypes = new Array();fnames[0]='EMAIL';ftypes[0]='email';fnames[1]='FNAME';ftypes[1]='text';fnames[2]='LNAME';ftypes[2]='text';fnames[3]='ADDRESS';ftypes[3]='address';fnames[4]='PHONE';ftypes[4]='phone';fnames[5]='BIRTHDAY';ftypes[5]='birthday';fnames[6]='COMPANY';ftypes[6]='text';}(jQuery))</script>
")

(local stripe
  [:div {}
   [:script {:async true :src "https://js.stripe.com/v3/pricing-table.js"}]
   [:stripe-pricing-table {:pricing-table-id "prctbl_1ONAmfByfLhKEshp1MgHyTtc"
                           :publishable-key "pk_live_51NJdTqByfLhKEshpzNjQmV9nERvHTE9zzS632pwzxWBENy463c7UijEkcos5qGOhD6p26M2MvuK7429tINybwuRU006vWBC0ou"}]])

(fn article-links [n]
  (let [cmd (string.format "ls -pat html/articles/*-preview.html | head -n %s" n)]
    (accumulate [ul [:ul {:class :dates}] v (: (io.popen cmd) :lines)]
      (let [article (string.gsub v "%-preview%.html" "")
            article (string.gsub article "html%/" "")]
        (do 
          (table.insert
            ul
            [:li {:style "margin-top: 80px;"}
             (files.read v)
             [:a {:class :button
                  :style "float: right; margin-top: 20px;"
                  :href (.. "/" article)} "Read more"]])
          ul)))))

(fn article-previews [n]
  (let [cmd (string.format "ls -pat html/articles/*-preview.html | head -n %s" n)]
    (accumulate [d "" v (: (io.popen cmd) :lines)]
      (let [article (string.gsub v "%-preview%.html" "")
            article (string.gsub article "html%/" "")]
        (.. d
            (files.read v)
            "<div style=\"width: 100%;text-align:right;\"><a class=\"button\" href=\"/" article "\">Read more</a></div>")))))

(local testimonials
       [:div {}
        [:blockquote {}
         "We and have seen value in their offerings from the beginning.
    It was easy to get started and their detailed knowledge on backend systems has been invaluable."
         [:br {}]
         [:br {}]
         [:b {} "James Parmley"]
         [:br {}]
         [:i {} "Director of Engineering"]
         [:br {}]
         [:b {} "Health Partners Group"]]])

(local clients
  [{:url "/pages/clients/crossref"
    :image "/data.jpg"
    :title "Crossref"
    :summary "Crossref metadata is open and available for reuse without restriction. There are currently 156,563,111 records, these include information about research objects like articles, grants and awards, preprints, conference papers."}
   {:url "/pages/clients/bags"
    :image "/bags.jpg"
    :title "BAGS"
    :summary "Bookmakers Afternoon Greyhound Services Ltd provides gambling and betting services. The Company offers live and virtual greyhound racing, betting and other relevant information."}
   {:url "/pages/clients/keyframesports"
    :image "/kfs.jpg"
    :title "Keyframe"
    :summary "Keyframe Sports provide first class video telestration software.
    We started working with Keyframe Sports to help build their first class video telestration software and to steady their platform through a period of growth."}
   {:url "/pages/clients/healthpartners"
    :image "/drugs.jpg"
    :title "Health Partners"
    :summary "Health Partners Group are a fmvull-service occupational health company delivering end-to-end solutions."}
   {:url "/pages/clients/algorithmica"
    :image "/code.jpg"
    :title "Algorithmica"
    :summary "Algorithmica is an IT consultancy and service provider based in London.
    Algorithmica is a valued partner and we have collaborated on many projects together."}
   {:url "/pages/clients/abv"
    :image "/abv.jpg"
    :title "A&B Vintners"
    :summary "A&B Vintners is one of the UK's leading specialist wine importers."}])

(fn render-clients []
  (accumulate [h [:div {:class :row}] _ c (pairs clients)]
    (do 
      (table.insert 
        h 
        [:div {:class "col-4 col-6-medium col-12-small"}
         [:section {:class :box}
          [:a {:href c.url :class "image featured"}
           [:img {:src c.image}]]
          [:header {}
           [:h3 {} c.title]]
          [:p {} c.summary]
          [:footer {}
           [:ul {:class :actions}
            [:li {}
             [:a {:href c.url :class "button alt"} "Find out more"]]]]]])
      h)))

{: mailchimp
 : render-clients
 : stripe
 : testimonials
 : article-links
 : article-previews }
