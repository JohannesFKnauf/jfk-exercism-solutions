(ns allergies)

(def allergenes
  [:eggs :peanuts :shellfish :strawberries :tomatoes :chocolate :pollen :cats])

(def allergene-map
  (zipmap (iterate (partial * 2) 1) allergenes))

(defn test-allergy [code [bit allergy]]
  (->> bit
       (bit-and code)
       (not= 0)))

(defn allergies [code]
  (->> allergene-map
       (filter (partial test-allergy code))
       (map second)))

(defn allergic-to? [code allergene]
  (-> code
      (allergies)
      (set)
      (contains? allergene)))
