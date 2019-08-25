(ns beer-song)

(defn bottle-phrase [num]
  (str (case num
         0 "no more bottles"
         1 "1 bottle"
         (str num " bottles"))
       " of beer"))

(defn bottle-line [num]
  (str (clojure.string/capitalize (bottle-phrase num))
       " on the wall, "
       (bottle-phrase num)
       ".\n"))

(defn action-line [num]
  (if (zero? num)
    (str "Go to the store and buy some more, "
         (bottle-phrase 99)
         " on the wall.\n")
    (str "Take "
         (if (== 1 num) "it" "one")
         " down and pass it around, "
         (bottle-phrase (dec num))
         " on the wall.\n")))

(defn verse
  "Returns the nth verse of the song."
  [num]
  (str (bottle-line num)
       (action-line num)))

(defn sing
  "Given a start and an optional end, returns all verses in this interval. If
  end is not given, the whole song from start is sung."
  ([start]
   (sing start 0))
  ([start end]
   (clojure.string/join "\n"
                        (map verse
                             (range start (dec end) -1)))))
