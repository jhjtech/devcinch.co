(local regions
  [:us-east-1
   :us-east-2
   :us-west-1
   :us-west-2
   :af-south-1
   :ap-east-1
   :ap-south-2
   :ap-southeast-3
   :ap-southeast-5
   :ap-southeast-4
   :ap-south-1
   :ap-northeast-3
   :ap-northeast-2
   :ap-southeast-1
   :ap-southeast-2
   :ap-northeast-1
   :ca-central-1
   :ca-west-1
   :cn-north-1
   :cn-northwest-1
   :eu-central-1
   :eu-west-1
   :eu-west-2
   :eu-south-1
   :eu-west-3
   :eu-south-2
   :eu-north-1
   :eu-central-2
   :il-central-1
   :me-south-1
   :me-central-1
   :sa-east-1])

(local access-levels
  [:Instant
   :Minutes
   :Hours])

(local classes
  {:standard 
   {:selected true
    :free-gb 5
    :description :Standard
    :price {:default 0.023
            :us-west-1 0.026}}
   :intelligent 
   {:description :Intelligent
    :price {:default 0.023
            :us-west-1 0.026}}
   :standard-infrequent 
   {:description "Standard Infrequent"
    :price {:default 0.0125
            :us-west-1 0.0144}}
   :glacier-instant 
   {:description "Glacier Instant"
    :info "For long-lived archive data accessed once a quarter with instant retrieval in milliseconds."
    :price {:default 0.004
            :us-west-1 0.005}}
   :glacier-flexible 
   {:description "Glacier Flexible"
    :info "For long-term backups and archives with retrieval option from 1 minute to 12 hours."
    :price {:default 0.0036
            :us-west-1 0.0045}}
   :glacier-deep-archive 
   {:description "Glacier Deep Archive"
    :info "For long-term data archiving that is accessed once or twice in a year and can be restored within 12 hours."
    :price {:default 0.00099
            :us-west-1 0.002}}
   :google-standard 
   {:hidden true
    :description "Google Cloud Standard"
    :info "Best for frequently accessed (\"hot\" data) and/or stored for only brief periods of time."
    :free-gb 5
    :price {:default 0.02}}
   :google-nearline 
   {:hidden true
    :description "Google Cloud Nearline"
    :info "Best for service for storing infrequently accessed data."
    :free-gb 5
    :price {:default 0.01}}
   :google-coldline 
   {:hidden true
    :description "Google Cloud Coldline"
    :info "Best for storing infrequently accessed data."
    :free-gb 5
    :price {:default 0.004}}
   :google-archive
   {:hidden true
    :description "Google Cloud Archive"
    :info "Best for data archiving, online backup, and disaster recovery."
    :free-gb 5
    :price {:default 0.0012}}})

(fn calculate [size class region bill-percent]
  (let [bill-size (* (/ size 100) bill-percent)
        cl (. classes class)
        price-per-gb 
        (or (. cl :price region)
            (. cl :price :default))
        free-gb 
        (or (. cl :free-gb)
            0)
        price (* price-per-gb (- bill-size free-gb))]
    {:price price-per-gb
     :monthly price
     :description cl.description
     :info (. cl :info)
     :yearly (* price 12)}))

(fn compare [current size class region bill-percent]
  (let [bill-size (* (/ size 100) bill-percent)
        cl (. classes class)
        price-per-gb 
        (or (. cl :price region)
            (. cl :price :default))
        free-gb 
        (or (. cl :free-gb)
            0)
        price (* price-per-gb (- bill-size free-gb))]
    {:price price-per-gb
     :monthly price
     :description cl.description
     :info (. cl :info)
     :cheaper (< price current.monthly)
     :yearly (* price 12)}))

{: regions 
 : access-levels
 : classes
 : calculate
 : compare }
