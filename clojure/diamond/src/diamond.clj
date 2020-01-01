(ns diamond)

(def a-offset
  (int \A))

(defn padding [n]
  (apply str (repeat n \space)))

(defn gen-line [mi i]
  (if (= i 0)
    (let [pad-lr mi]
      (apply str (padding pad-lr) \A (padding pad-lr)))
    (let [pad-lr (- mi i)
          pad-m (-> mi
                    (* 2)
                    (+ 1)
                    (- (* 2 pad-lr))
                    (- 2))
          chr (char (+ i a-offset))]
      (apply str (padding pad-lr) chr (padding pad-m) chr (padding pad-lr)))))

(defn diamond [chr]
  (let [chr-offset (int chr)
        max-idx (- chr-offset a-offset)
        is (concat (range max-idx) (range max-idx -1 -1))]
    (map (partial gen-line max-idx) is)))
