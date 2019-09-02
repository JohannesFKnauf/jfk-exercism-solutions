(ns allergies)

(def allergenes
  [:eggs :peanuts :shellfish :strawberries :tomatoes :chocolate :pollen :cats])

(def allergene-map
  (zipmap allergenes (range)))

(defn allergic-to? [code allergene]
  (bit-test code (get allergene-map allergene)))

(defn allergies [code]
  (filter (partial allergic-to? code) allergenes))
