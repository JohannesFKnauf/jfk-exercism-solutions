(ns difference-of-squares)

(defn square [n]
  (* n n))

(defn sum-of-squares [n]
  (-> (+ 1 (* 2 n))
      (* (+ n 1))
      (* n)
      (/ 6)))

(defn square-of-sum [n]
  (-> (+ n 1)
      (* n)
      (/ 2)
      square))

(defn difference [n]
  (- (square-of-sum n)
     (sum-of-squares n)))
