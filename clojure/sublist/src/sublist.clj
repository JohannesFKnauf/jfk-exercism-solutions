(ns sublist)

(defn sublist? [a b]
  (cond
    (< (count b) (count a)) false
    (not-any? false? (map = a b)) true
    :else (recur a (drop 1 b))))

(defn classify [a b]
  (let [a-sub-b (sublist? a b)
        b-sub-a (sublist? b a)]
    (cond
      (and a-sub-b b-sub-a) :equal
      a-sub-b :sublist
      b-sub-a :superlist
      :else :unequal)))
