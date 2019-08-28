(ns bob)

(def any? 
  (complement not-any?))


(defn all-whitespace? [s]
  (every? #(Character/isSpaceChar %) s))

(defn uppercase-or-no-letter? [c]
  (cond (Character/isLetter c) (Character/isUpperCase c)
        :else true))

(defn all-uppercase? [s]
  (every? uppercase-or-no-letter? s))

(defn contains-a-letter? [s]
  (any? #(Character/isLetter %) s))


(defn yelling? [s]
  (and (all-uppercase? s) (contains-a-letter? s)))

(defn question? [s]
  (clojure.string/ends-with? s "?"))

(defn saying-nothing? [s]
  (all-whitespace? s))


(defn response-for [s]
  (cond (saying-nothing? s) "Fine. Be that way!"
        (and (yelling? s) (question? s)) "Calm down, I know what I'm doing!"
        (yelling? s) "Whoa, chill out!"
        (question? s) "Sure."
        :else "Whatever."))
