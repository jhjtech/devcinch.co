(local style (require :style))
(local html (require :html))
(local s3 (require :s3))

(local mailchimp
  "<div id=\"mc_embed_shell\">
  <link href=\"//cdn-images.mailchimp.com/embedcode/classic-061523.css\" rel=\"stylesheet\" type=\"text/css\">
  <style type=\"text/css\">
  #mc_embed_signup background:#fff; false;clear:left; font:14px Helvetica,Arial,sans-serif; width: 600px;}
  /* Add your own Mailchimp form style overrides in your site stylesheet or in this style block.
  We recommend moving this block and the preceding CSS link to the HEAD of your HTML file. */
  </style>
  <div id=\"mc_embed_signup\">
  <form action=\"https://ltd.us10.list-manage.com/subscribe/post?u=defbb29af77e62d14937e5328&amp;id=58d8f9c678&amp;f_id=0067f7e3f0\" method=\"post\" id=\"mc-embedded-subscribe-form\" name=\"mc-embedded-subscribe-form\" class=\"validate\" target=\"_blank\">
  <div id=\"mc_embed_signup_scroll\"><h2>Get your savings report! </h2>
  <div class=\"indicates-required\"><span class=\"asterisk\">*</span> indicates required</div>
  <div class=\"mc-field-group\"><label for=\"mce-EMAIL\">Email Address <span class=\"asterisk\">*</span></label><input type=\"email\" name=\"EMAIL\" class=\"required email\" id=\"mce-EMAIL\" required=\"\" value=\"\"></div>
  <div id=\"mce-responses\" class=\"clear foot\">
  <div class=\"response\" id=\"mce-error-response\" style=\"display: none;\"></div>
  <div class=\"response\" id=\"mce-success-response\" style=\"display: none;\"></div>
  </div>
  <div aria-hidden=\"true\" style=\"position: absolute; left: -5000px;\">
  /* real people should not fill this in and expect good things - do not remove this or risk form bot signups */
  <input type=\"text\" name=\"b_defbb29af77e62d14937e5328_58d8f9c678\" tabindex=\"-1\" value=\"\">
  </div>
  <div class=\"optionalParent\">
  <div class=\"clear foot\">
  <input type=\"submit\" name=\"subscribe\" id=\"mc-embedded-subscribe\" class=\"button\" value=\"Subscribe\">
  <p style=\"margin: 0px auto;\"><a href=\"http://eepurl.com/i3Vu0k\" title=\"Mailchimp - email marketing made easy and fun\"><span style=\"display: inline-block; background-color: transparent; border-radius: 4px;\"><img class=\"refferal_badge\" src=\"https://digitalasset.intuit.com/render/content/dam/intuit/mc-fe/en_us/images/intuit-mc-rewards-text-dark.svg\" alt=\"Intuit Mailchimp\" style=\"width: 220px; height: 40px; display: flex; padding: 2px 0px; justify-content: center; align-items: center;\"></span></a></p>
  </div>
  </div>
  </div>
  </form>
  </div>
  <script type=\"text/javascript\" src=\"//s3.amazonaws.com/downloads.mailchimp.com/js/mc-validate.js\"></script><script type=\"text/javascript\"> function($)  window.fnames = new Array(); window.ftypes = new Array();fnames[0]='EMAIL';ftypes[0]='email';fnames[1]='FNAME';ftypes[1]='text';fnames[2]='LNAME';ftypes[2]='text';fnames[3]='ADDRESS';ftypes[3]='address';fnames[4]='PHONE';ftypes[4]='phone';fnames[5]='BIRTHDAY';ftypes[5]='birthday';fnames[6]='COMPANY';ftypes[6]='text';}(jQuery));var $mcj = jQuery.noConflict(true);</script></div>
")

(local doctype "<!DOCTYPE html>")

(fn master [body]
  [:html {:lang "en"}
   [:head {} style
    [:meta {:name "viewport" :content "width=device-width, initial-scale=1.0"}]
    [:meta {:name "description" :content "Devcinch is a software development subscription service, giving you flexible access to expert software developers!"}]
    [:meta {:name "author" :content "devcinch"}]
    [:meta {:name "keywords" :content "software dev, developer, development as a service, software consultant, cheap software dev"}]
    [:link {:rel "canonical" :href "https://devcinch.co"}]
    [:link {:rel "icon" :href "/favicon.png"}]
    [:title {} "Devcinch: Software Development as a service to scale your business!"]]
   body])

(local footer 
  [:footer {}
   "Copyright JHJ Technology Limited | Company Number 12418911"])


(fn qna [question answer]
  [:details {} 
   [:summary {} [:b {} question]]
   [:p {} answer]])

(fn faq []
  [:div {}
   (qna 
     "Why wouldn't I just hire a senior developer?"
     "Good question! The annual cost of a full-time senior developer now exceeds £65,000, that's not including benefits! You may not always have enough work to keep them busy.
      With our monthly plans, you can pause and resume your subscription as often as you need, to make sure you are only charged when you have work available.
     ")
   (qna
     "How do I request development?"
     "We offer a lot of flexibility. Some common ways clients request development work is directly via Trello, or with links to the clients existing ticking management system.")
   (qna
     "Is there a limit to the work I can request?"
     "You can request as much work as you like but there can only be one task currently in progress.")
   (qna
     "How fast is the work done?"
     "Like most software development tasks, the length is quite varied. Typically we do small-medium sized tasks in 1-3 days, more complex development takes longer.")
   
   (qna
     "What if I only have one development task?"
     "That's fine. When the task is finished you can pause your subscription and keep the remainder of it for when you have additional tasks.")
   
   (qna
     "What does it mean to pause my subscription?"
     "Pausing your subscription is useful when you don't have enough development tasks to take up a whole month.
     Billing cycles are based on a 31 day period. As an example, if you sign up and use the service for 11 days, and then decide to pause your subscription you will have 20 days left to use at another time.")
   
   (qna
     "What about holidays and sickness?"
     "During periods of sickness or holidays your subscription will be paused so that you don't lose any available time.")
   
   (qna
     "What technology do you use?"
     "We have experience with a range of technology, including .NET, Java, Kotlin, Clojure, JavaScript, and many modern development platforms. We can get up to speed quickly with your development stack.")
   
   (qna
     "What about on-boarding?"
     "We appreciate the on-boarding process to bring a new developer up to speed can be significant, with this in mind, we allow a 3 day free trial to begin the process.")
   
   (qna
     "Who are the developers?"
     [:div {}
      "Our developers are lead by "
      [:a {:href "https://www.jhj.ltd/about.html"} "Mark"]
      " .You will likely get to work directly with him, however, we have a network of trusted developers to call upon if needed"])
   
   (qna
     "How do you maintain quality?"
     "We limit the number of subscriptions available so that concurrent users never go above a threshold that allows us to maintain a high level of service.")
   
   (qna
     "Will I as be in direct touch with the developer or is there a project manager involved?"
     "Devcinch provides direct access to the developer.")
   
   (qna
     "How can I have daily contact with the developer?"
     "We understand that although email works great with some clients, Slack and other messaging services work better for others. We are happy to be flexible but synchronous meeting and calls generally won't work well with our process.")
   
   (qna
     "Where are your developers based?"
     "We are based in the UK")
   
   (qna
     "What kind of development work is a good fit?"
     "Well understood, packaged, and isolated work is an excellent fit. Things like performance tuning, code review, security concerns, and other well defined cross cutting concepts can also work well. ")])


(fn index []
  (.. doctype
      (html 
        (master
          [:body {}
           [:header {}
            [:img {:src "/devcinch.webp"}]]
           [:main {}
            [:h1 {} "Software Development as a Service to scale your business!"]
            [:h3 {} "Our unique take on Software Development, is a cinch!"]
            [:p {} "
             Our subscription product Devcinch allows you access to a software developer, 
             replacing unreliable freelancers and expensive agencies for one flat monthly fee.
             "]
            [:p {} "
             We specialise in speed of delivery and excel when working with our clients in an async nature.
             "]
            [:p {} "
             The annual cost of a full-time senior developer now exceeds £65,000, that's not including benefits! 
             "]
            [:p {} "
             You may not always have enough work to keep them busy and you can't easily stop paying them, 
             not only is Devcinch cheaper over a 12 month period but you can cancel at any time! 
             "]
            [:blockquote {}
             [:p {}
              "We used Devcinch to bring some additional resource into our existing engineering team and 
              have seen value in their offerings from the beginning."]
             [:p {}
              "It was easy to get started and their detailed knowledge on backend systems has been invaluable."]
             [:p {}
              [:b {} "James Parmley"]]
             [:p {} "Director of Engineering"]]
            [:h3 {}
             "Start for free now!"]
            [:script {:async "true" :src "https://js.stripe.com/v3/pricing-table.js"}]
            [:stripe-pricing-table {:pricing-table-id "prctbl_1PPVYMByfLhKEshpQlq3dVGx"
                                     :publishable-key "pk_live_51NJdTqByfLhKEshpzNjQmV9nERvHTE9zzS632pwzxWBENy463c7UijEkcos5qGOhD6p26M2MvuK7429tINybwuRU006vWBC0ou"}]
            [:h3 {}
             "FAQ"]
            (faq)]
           footer]))))

(fn subscribed []
  (.. doctype
      (html 
        (master
          [:body {}
           [:header {}
            [:img {:src "/devcinch.webp"}]]
           [:main {}
            [:h1 {} "Welcome to Devcinch!"]
            [:h3 {} "Thank you for subscribing."]
            [:p {}
             "You will shortly receive a welcome email with instructions for creating your first request!"
             "In the mean time, if you have any questions, please "
             [:a {:href "mailto:enquiries@jhj.ltd"} "contact us "]
             "and do check out the FAQ below:"]
            [:h3 {} "FAQ"]
            (faq)]
           footer]))))


{: master
 : index
 : subscribed }
