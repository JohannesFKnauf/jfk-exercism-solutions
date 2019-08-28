(ns isbn-verifier)

(defn isbn? [isbn]
  (boolean (some->> isbn
                    (#(clojure.string/replace % "-" ""))
                    (re-matches #"\d{9}[\dX]")
                    (map #(if (= % \X) 10 (Integer/parseInt (str %))))
                    (map * (range 10 0 -1))
                    (apply +)
                    (#(mod % 11))
                    (= 0))))
