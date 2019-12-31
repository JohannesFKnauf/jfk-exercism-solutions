(ns sieve)

(defn nil-multiples [s i]
  (let [limit (count s)
        multiples (range i (inc limit) i)
        true-multiples (drop 1 multiples)]
    (reduce #(assoc %1 %2 nil) s true-multiples)))

(defn adjust-sieve [s i]
  (if (get s i)
    (nil-multiples s i)
    s))

(defn sieve [limit]
  (let [ns (vec (range (inc limit)))
        prime-sieve (assoc ns 0 nil 1 nil)
        is (range 2 (inc (count prime-sieve)))
        sieved (reduce adjust-sieve prime-sieve is)]
    (remove nil? sieved)))
