(ns phone-number)

(def invalid-number "0000000000")

(defn non-digit-char? [char]
  (not (#{\0 \1 \2 \3 \4 \5 \6 \7 \8 \9} char)))

(defn strip-non-digits [num-string]
  (apply str (remove #(non-digit-char? %) num-string)))

(defn strip-leading-country-code [filtered-num-string]
  (case (count filtered-num-string)
    11 (if (= "1" (subs filtered-num-string 0 1))
         (subs filtered-num-string 1)
         invalid-number)
    10 filtered-num-string
    invalid-number))

(defn read-code-groups [filtered-num-string]
  {:area (subs filtered-num-string 0 3)
   :exchange (subs filtered-num-string 3 6)
   :subscriber (subs filtered-num-string 6 10)})

(defn number [num-string]
  (-> num-string
    (strip-non-digits)
    (strip-leading-country-code)))

(defn area-code [num-string]
  (:area (read-code-groups (number num-string))))

(defn pretty-print [num-string]
  (let [number (read-code-groups (number num-string))]
    (format "(%s) %s-%s" (:area number) (:exchange number) (:subscriber number))))
