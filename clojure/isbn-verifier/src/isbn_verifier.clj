(ns isbn-verifier)

(defn isbn? [isbn]
  (boolean (some->> isbn
                    (re-matches #"(\d)-?(\d)(\d)(\d)-?(\d)(\d)(\d)(\d)(\d)-?([\dX])")
                    (rest)
                    (map #(if (= % "X") 10 (Integer/parseInt %)))
                    (map * (range 10 0 -1))
                    (apply +)
                    (#(mod % 11))
                    (= 0))))
