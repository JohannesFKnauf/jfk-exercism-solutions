(ns spiral-matrix)


(defn transpose [matrix]
  (apply map vector matrix))

(defn rotate [matrix]
  (->> matrix
       transpose
       (map reverse)))

(defn spiral
  ([n]
   (if (= 0 n)
     '()
     (spiral n n 1)))
  ([i j s]
   (if (= 0 i)
     [[]]
     (cons (range s (+ s j))
           (rotate (spiral j
                           (dec i)
                           (+ s j)))))))

