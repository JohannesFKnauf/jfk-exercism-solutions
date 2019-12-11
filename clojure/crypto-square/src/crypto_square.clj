(ns crypto-square)

(defn normalize-plaintext [s] 
  (-> s
      (clojure.string/replace #"[^\p{Alnum}]" "")
      clojure.string/lower-case))

(defn square-size [s]
  (->> s
       count
       Math/sqrt
       Math/ceil
       int))

(defn plaintext-segments [s]
  (let [normalized (normalize-plaintext s)
        cols (square-size normalized)
        segments (partition-all cols normalized)]
    (map (partial apply str) segments)))

(defn transpose
  "transpose nested seqs
  behaves tolerant in case of incomplete rows/columns"
  [segments]
  (lazy-seq
   (let [header (map first segments)]
     (if (every? nil? header)
       nil
       (cons (remove nil? header)
             (transpose (map rest segments)))))))

(defn raw-ciphertext [s]
  (->> s
       plaintext-segments
       transpose
       (map (partial apply str))))

(defn ciphertext [s]
  (->> s
       raw-ciphertext
       clojure.string/join))

(defn normalize-ciphertext [s]
  (->> s
       raw-ciphertext
       (clojure.string/join " ")))
