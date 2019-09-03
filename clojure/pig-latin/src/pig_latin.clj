(ns pig-latin
  (:require clojure.string))

(defn translate [s]
  (clojure.string/replace s (re-pattern
                             (str "\\b("
                                  (clojure.string/join "|" ["(?:[aeiou]|xr|yt)\\w*"
                                                            "[bcdfghjklmnpqrstvwxz]*qu"
                                                            "[bcdfghjklmnpqrstvwxz]+y"
                                                            "[bcdfghjklmnpqrstvwxyz]+"])
                                  ")(\\w*)\\b"))
                          "$2$1ay"))
