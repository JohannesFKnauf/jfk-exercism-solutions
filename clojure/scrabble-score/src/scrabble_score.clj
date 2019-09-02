(ns scrabble-score)

(defn transform [source]
  (into {}
        (for [[score letters] source
              letter letters]
          [(clojure.string/lower-case letter) score])))

(def letter-scores
  (transform {1 ["A" "E" "I" "O" "U" "L" "N" "R" "S" "T"]
              2 ["D" "G"]
              3 ["B" "C" "M" "P"]
              4 ["F" "H" "V" "W" "Y"]
              5 ["K"]
              8 ["J" "X"]
              10 ["Q" "Z"]}))


(defn score-letter [letter]
  (->> letter
       (clojure.string/lower-case)
       (get letter-scores)))

(defn score-word [word]
  (->> word
       (map score-letter)
       (reduce + 0)))
