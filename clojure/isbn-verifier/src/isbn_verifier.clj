(ns isbn-verifier)

(defn isbn? [isbn]
  (boolean (some->> isbn
                    (re-matches #"(\d{1})-?(\d{3})-?(\d{5})-?([\dX])")
                    (rest)
                    (map seq)
                    (flatten)
                    (map #(if (= % \X)
                            10
                            (Integer/parseInt (str %))))
                    (map * (range 10 0 -1))
                    (apply +)
                    (#(mod % 11))
                    (= 0))))
