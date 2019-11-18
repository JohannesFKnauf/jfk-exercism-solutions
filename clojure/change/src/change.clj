(ns change)

(defn length<=
  "Compare lengths of two collections coll1 and coll2.
  nil is uncomparable."
  [coll1 coll2]
  (cond (nil? coll1) false
        (nil? coll2) false
        :else (<= (count coll1) (count coll2))))

(defn calculate-change [val coins]
  (let [coins-desc (into (list) (sort < coins))
        first-stack-frame [[] val coins-desc]]
    (loop [stack (list first-stack-frame)
           shortest-so-far nil]
      (if (empty? stack) shortest-so-far
          (let [[change rest-val rest-coins] (peek stack)
                rest-stack (pop stack)]
            (cond
              (neg? rest-val) (recur rest-stack shortest-so-far)
              (length<= shortest-so-far change) (recur rest-stack shortest-so-far)
              (zero? rest-val) (recur rest-stack change)
              :else (cond-> rest-stack
                      (not-empty rest-coins) (conj [change rest-val (pop rest-coins)])
                      (peek rest-coins) (conj [(conj change (peek rest-coins))
                                               (- rest-val (peek rest-coins))
                                               rest-coins])
                      :always (recur shortest-so-far))))))))

(defn issue [val coins]
  (if (neg? val) (throw (IllegalArgumentException. "cannot change negative values"))
      (if-let [simplest-change (calculate-change val coins)]
        (reverse simplest-change)
        (throw (IllegalArgumentException. "cannot change amount with given coins")))))
