(ns bob)

(defmacro static-fn
  "Takes a static Java method reference and wraps it into a clojure function."
  [f] `(fn [x#] (~f x#)))

(defn partial-rest [f & args]
  (fn [x]
    (-> f
        (partial x)
        (apply args))))

(def any-one?
  (complement not-any?))



(def all-whitespace?
  (partial every? (static-fn Character/isSpaceChar)))

(def all-uppercase?
  (partial not-any? (static-fn Character/isLowerCase)))

(def contains-a-letter?
  (partial any-one? (static-fn Character/isLetter)))


(def yelling?
  (every-pred all-uppercase? contains-a-letter?))

(def question?
  (partial-rest clojure.string/ends-with? "?"))

(def saying-nothing?
  all-whitespace?)


(defn response-for [s]
  (cond (saying-nothing? s) "Fine. Be that way!"
        (and (yelling? s) (question? s)) "Calm down, I know what I'm doing!"
        (yelling? s) "Whoa, chill out!"
        (question? s) "Sure."
        :else "Whatever."))
