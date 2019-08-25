(ns reverse-string)

(defn reverse-string [s]
  (loop [result ""
         remainder s]
    (if (empty? remainder) result
        (recur (str (first remainder) result)
               (rest remainder)))))
