(ns sieve)

(defn nil-multiples [s i]
  (let [multiples (drop 1 (range i (inc (count s)) i))]
    (reduce #(assoc %1 %2 nil) s multiples)))

(defn adjust-sieve [s i]
  (if (get s i)
    (nil-multiples s i)
    s))

(defn sieve [limit]
  (let [prime-sieve (-> limit
                        inc
                        range
                        vec
                        (assoc 0 nil 1 nil))
        is (range 2 (inc (count prime-sieve)))
        sieved (reduce adjust-sieve prime-sieve is)]
    (remove nil? sieved)))
