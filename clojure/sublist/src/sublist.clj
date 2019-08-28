(ns sublist)

(defn sublist? [a b]
  (->> b
       (partition (count a) 1)
       (some #(= a %))))

(defn classify [a b]
  (cond
    (= a b) :equal
    (sublist? a b) :sublist
    (sublist? b a) :superlist
    :else :unequal))
