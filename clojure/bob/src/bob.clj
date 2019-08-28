(ns bob)

(defmacro static-fn [f] `(fn [x#] (~f x#)))


(defn all-whitespace? [s]
  (every? (static-fn Character/isSpaceChar) s))

(defn all-uppercase? [s]
  (not-any? (static-fn Character/isLowerCase) s))

(defn contains-a-letter? [s]
  (->> s
       (some (static-fn Character/isLetter))
       (boolean)))


(defn yelling? [s]
  (and (all-uppercase? s)
       (contains-a-letter? s)))

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

