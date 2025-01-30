(local style (require :style))
(local html (require :html))
(local files (require :files))
(local snippets (require :snippets))

(local doctype "<!DOCTYPE html>")

(fn tchelper [first rest] (.. (first:upper) (rest:upper)))
(fn caps [s] (string.gsub s "(%a)([%w_']*)" tchelper))

(local footer 
  [:section {:id :footer}
   [:div {:class :container}
    [:div {:class :row}
     [:div {:class "col-8 col-12-medium"}
      [:section {}
       [:header {}
        [:h2 {}
         "Recent Articles"]] 
       (snippets.article-links 10)]]
     [:div {:class "col-4 col-12-medium"}
      [:section {}
       [:header {}
        [:h2 {} "Get in touch!"]]
       [:ul {:class :contact}
        [:li {}
         [:h3 {} "Address"]
         [:p {} "Tividale"]
         [:p {} "Oldbury"]
         [:p {} "West Midlands"]
         [:p {} "United Kingdom"]]
        [:li {}
         [:h3 {} "Phone"]
         [:p {} "+44 7894 054 759"]]
        [:li {}
         [:h3 {} "Mail"]
         [:p {} [:a {:href "mailto:enquiries@jhj.ltd"} "enquiries@jhj.ltd"]]]]]]
     [:div {:class :col-12}
      [:div {:id :copyright}
       [:ul {:class :links}
        [:li {} "&copy; JHJ Technology Limited" ]
        [:li {} "Company Number 12418911" ]
        [:li {} "Design: " [:a {:href "http://html5up.net"} "HTML5 UP"]]]]]
     ]]])

(fn master [intro body link title include-banner]
  [:html {:lang "en"}
   [:head {} style
    [:link {:rel :stylesheet :href "/fontawesome-all.min.css"}]
    [:meta {:name "viewport" :content "width=device-width, initial-scale=1.0"}]
    [:meta {:name "description" :content "Clojure software development and consultancy, rapid mvp, prototyping, and devops."}]
    [:meta {:name "keywords"
            :content (..
                       "software development, clojure consultancy, software development as a service, save money on software dev, software engineering, software dev west midlands, software engineer west midlands, software dev birmingham, software engineer birmingham, software development as a service, cheap software dev, cto co founder "
                       (if title (.. ", " title) ""))}]
    [:link {:rel "icon" :href "/icon.png"}]
    [:link {:rel "canocical" :href link}]
    [:title {} (.. "Devcinch by JHJ Technology Ltd: " (or title "Easy access to high quality software development"))]]
   [:body {:class "homepage is-preload"} 
    [:div {:id :page-wrapper}
     [:section {:id :header}
      [:a {:href "/"} [:img {:style "margin-top:40px;" :src "/devcinch.webp"}]]
      [:nav {:id :nav} 
       [:ul {} 
        [:li {:class (if (= link "/") "current" "")} [:a {:href "/"} "Home"]]
        [:li {:class (if (string.match link "%/clients") "current" "")} [:a {:href "/clients"} "Clients"]]
        [:li {:class (if (string.match link "%/faq") "current" "")} [:a {:href "/pages/faq"} "FAQ"]]
        [:li {:class (if (string.match link "%/articles") "current" "")} [:a {:href "/articles"} "Articles"]]]]

      (when include-banner 
        [:section {:id :banner}
         [:header {}
          [:h2 {:style "text-decoration:italic;"} "Devcinch"]
          [:p {} "Software Development as a Service - Turning Your Big Ideas into Robust Software Solutions!"]]])

      intro]
     body
     footer]
    [:script {:src "/js/jquery.min.js"}]
    [:script {:src "/js/jquery.dropotron.min.js"}]
    [:script {:src "/js/browser.min.js"}]
    [:script {:src "/js/breakpoints.min.js"}]
    [:script {:src "/js/util.js"}]
    [:script {:src "/js/main.js"}]]])

(fn articles []
  (.. doctype
      (html 
        (master
          [:div {}]
          [:section {:id :main}
           [:div {:class :container}
            [:div {:class :row}
             [:div {:class :col-12}
              [:section {}
               [:header {:class :major}
                [:h2 {} "Our Articles"]]
               [:section {:class :box} (snippets.article-previews 1000)]]]]]]
          "/articles"
          "Our latest articles"
          false))))

(fn article [a]
  (let [title (caps (-> a
                        (string.gsub "%/articles%/" "")
                        (string.gsub "%-" " ")))]
    (.. doctype
        (html 
          (master
            [:div {}]
            [:section {:id :main}
             [:div {:class :container}
              [:div {:class :row}
               [:div {:class :col-12}
                [:section {}
                 [:header {:class :major}
                  [:h2 {} title ]]
                 [:section {:class :box} (files.read (.. "./html" a ".html"))]
                 [:section {:class :box}
                  [:div {:class :col-12}
                   [:section {}
                    [:header {}
                     [:h2 {} "Lets Get Started!"]]
                    [:p {} "Enter your email address in the form below and let us start bringing your big ideas to life. We won't use your email address for anything else."]]
                   snippets.mailchimp]]]]]]]
            a
            title
            false)))))

(fn page [a]
  (let [title (caps (-> a
                        (string.gsub "%/pages%/clients%/" "")
                        (string.gsub "%/pages%/" "")
                        (string.gsub "%-" " ")))]
    (.. doctype
        (html 
          (master
            [:div {}]
            [:section {:id :main}
             [:div {:class :container}
              [:div {:class :row}
               [:div {:class :col-12}
                [:section {}
                 [:header {:class :major}
                  [:h2 {} title ]]
                 [:section {:class :box} (files.read (.. "./html" a ".html"))]
                 [:section {:class :box}
                  [:div {:class :col-12}
                   [:section {}
                    [:header {}
                     [:h2 {} "Lets Get Started!"]]
                    [:p {} "Enter your email address in the form below and let us start bringing your big ideas to life. We won't use your email address for anything else."]]
                   snippets.mailchimp]]]]]]]
            a
            title
            false)))))

(fn clients []
  (.. doctype
      (html 
        (master
          [:section {:id :intro :class :container}
           [:div {:class :row}
            [:div {:class "col-4 col-12-medium"}
             [:section {:class :first}
              [:i {:class "icon solid featured fa-cog"}]
              [:header {}
               [:h2 {} "Clojure Consultancy"]
               [:p {} "We have a wealth of experience when it comes to Clojure and we believe Clojure sets us apart and is our \"superpower\" for delivering robust high quality systems quickly.
                We have worked on many \"real time\" Clojure based distributed systems across the full stack."]]]]

            [:div {:class "col-4 col-12-medium"}
             [:section {:class :middle}
              [:i {:class "icon solid featured alt fa-users"}]
              [:header {}
               [:h2 {} "Technical Leadership"]
               [:p {} "We stay up-to-date with the latest technology trends and offer innovative solutions that help you stay ahead of the competition."]]]]

            [:div {:class "col-4 col-12-medium"}
             [:section {:class :first}
              [:i {:class "icon solid featured fa-hourglass-start"}]
              [:header {}
               [:h2 {} "Bootstrapping"]
               [:p {} "Our tech stack allows for rapid iteration and short lead times, allowing you to realise and bring your ideas to market quickly."]]]]]]
          [:section {:id :main}
           [:div {:class :container}
            [:div {:class :row}
             [:div {:class :col-12}
              [:section {}
               [:header {:class :major}
                [:h2 {} "Our Clients"]]
               (snippets.render-clients)]]]]]
          "/clients"
          "Our Clients"
          false))))

(fn index []
  (.. doctype
      (html 
        (master
          [:section {:id :intro :class :container}
           [:div {:class :row}
            [:div {:class "col-4 col-12-medium"}
             [:section {:class :first}
              [:i {:class "icon solid featured fa-seedling"}]
              [:header {}
               [:h2 {} "Devcinch Basic"]
               [:p {} "Supercharge your software development with our Basic plan! Our basic plan can get you started with a developer right away!"]
               [:h3 {} "£2,495 per month"]
               [:ul {:style "margin-top: 10px;"}
                [:li {:class "feature-list-item"} "Cancel anytime"]
                [:li {:class "feature-list-item"} "Minimum 4 Day(s) Dev /month"]
                [:li {:class "feature-list-item"} "Async comms - email/slack etc"]]
               [:a {:class :button :href "https://buy.stripe.com/fZe6rTbbkf72gJGfZk"}
                "Subscribe"]]]]

            [:div {:class "col-4 col-12-medium"}
             [:section {:class :middle}
              [:i {:class "icon solid featured alt fa-leaf"}]
              [:header {}
               [:h2 {} "Devcinch Standard"]
               [:p {} "Supercharge your software development with our Standard plan! Our most popular Standard plan is like having your own senior engineer!"]
               [:h3 {} "£5,499 per month"]
               [:ul {:style "margin-top: 10px;"}
                [:li {:class "feature-list-item"} "All from basic plan"]
                [:li {:class "feature-list-item"} "Minimum 9 Day(s) Dev /month"]
                [:li {:class "feature-list-item"} "Bring your own tools, JIRA etc"]]
               [:a {:class :button :href "https://buy.stripe.com/3cs5nP2EO3okdxu14r"}
                "Start Trial"]]]]

            [:div {:class "col-4 col-12-medium"}
             [:section {:class :first}
              [:i {:class "icon solid featured fa-tree"}]
              [:header {}
               [:h2 {} "Devcinch Plus"]
               [:p {} "Supercharge your software development with our Plus plan! Our Plus plan integrates a senior engineer into your team and workflow!"]
               [:h3 {} "£11,995 per month"]
               [:ul {:style "margin-top: 10px;"}
                [:li {:class "feature-list-item"} "All from standard plan"]
                [:li {:class "feature-list-item"} "Minimum 20 Day(s) Dev /month"]
                [:li {:class "feature-list-item"} "Fully integrated"]]
               [:a {:class :button :href "https://buy.stripe.com/00gg2t7Z8bUQ3WUdRb"}
                "Start Trial"]]]]]]
          [:section {:id :main}
           [:div {:class :container}
            [:div {:class :row :style "margin-bottom:40px;"}
             [:div {:class :col-12}
              [:section {:class :box}
               [:div {:class "center"}
                [:h3 {} "Our unique take on Software Development, is a cinch!"]
                [:p {:style "margin-top:20px;"} "Our subscription product Devcinch allows you access to a software developer, replacing unreliable freelancers and expensive agencies for one flat monthly fee."]
                [:p {:style "margin-top:20px;"} "We specialise in speed of delivery and excel when working with our clients in an async nature."]
                [:b {:style "margin-top:20px;"} "The annual cost of a full-time senior developer now exceeds £65,000, that's not including benefits!

                 You may not always have enough work to keep them busy and you can't easily stop paying them, not only is Devcinch cheaper over a 12 month period but you can cancel at any time!"]]]]]
            [:div {:class :row}
             [:div {:class :col-12}
              [:section {:class "box large-quote"}
               [:div {:class :center}
                [:blockquote 
                 {:class :major}
                 "\"Understanding the problem and coming up with great solutions is what these guys do, the team are approachable and fantastic communicators to all stakeholders and their technical expertise is second to none.\""]
                [:b {:class :major-quote-name}
                 "Marcus Westgate"]]
               [:div {:class :center}
                [:i {:class :major-quote-role}
                 "Product Manager"]]]]]
            [:div {:class :row}
             [:div {:class :col-12}
              [:section {}
               [:header {:class :major}
                [:h2 {} "Our Clients"]]
               (snippets.render-clients)]]]
            [:div {:class :row :style "margin-top:40px;"}
             [:div {:class :col-12}
              [:section {:class "box large-quote"}
               [:div {:class :center}
                [:blockquote 
                 {:class :major}
                 "\"We used JHJ to bring some additional resource into our existing engineering team and have seen value in their offerings from the beginning. It was easy to get started and their detailed knowledge on backend systems has been invaluable.\""]
                [:b {:class :major-quote-name}
                 "James Parmley"]]
               [:div {:class :center}
                [:i {:class :major-quote-role}
                 "Director of Engineering"]]]]]
            ]]
          "/"
          "Clojure Consultancy and Bespoke Software Development"
          true))))



{: master
 : article
 : articles
 : clients
 : page
 : index }
