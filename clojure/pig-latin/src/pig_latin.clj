(ns pig-latin
  (:require clojure.string))


(defn translate [s]
  (let [word-starts ["(?:[aeiou]|xr|yt)\\w*"
                     "[bcdfghjklmnpqrstvwxz]*qu"
                     "[bcdfghjklmnpqrstvwxz]+y"
                     "[bcdfghjklmnpqrstvwxyz]+"]
        pig-pattern (re-pattern (str "\\b("
                                     (clojure.string/join "|" word-starts)
                                     ")(\\w*)\\b"))]
    (clojure.string/replace s pig-pattern "$2$1ay")))
