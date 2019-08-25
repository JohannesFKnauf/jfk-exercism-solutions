(ns armstrong-numbers)

(defn digits [number]
  (loop [n number
         ds nil]
    (if (zero? n)
      ds
      (recur (quot n 10)
             (cons (rem n 10) ds)))))

(defn pow [x n]
  (reduce * (repeat x n)))

(defn armstrong? [num]
  (== num
      (reduce +
              (let [ds (digits num)]
                (map (partial pow (count ds))
                     ds)))))
