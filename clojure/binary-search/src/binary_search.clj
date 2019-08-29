(ns binary-search)

(defn middle
  "Calculates the middle between a lower bound l and an upper bound u.
  When given a seq takes its extents as l and u.
  Is proofed against known integer overflow bug https://ai.googleblog.com/2006/06/extra-extra-read-all-about-it-nearly.html"
  ([coll]
   (middle 0 (dec (count coll))))
  ([l u]
   (-> u
       (- l)
       (quot 2)
       (+ l))))

(defn search-for
  "Searches for a value x in a collection coll."
  ([x coll]
   (search-for x coll 0 (dec (count coll))))
  ([x coll l u]
   (if (< u l)
     (throw (RuntimeException. (str "Element with value " x " not found")))
     (let [m (middle l u)
           mth (nth coll m)]
       (cond
         (> mth x) (recur x coll l (dec m))
         (< mth x) (recur x coll (inc m) u)
         (= mth x) m)))))
