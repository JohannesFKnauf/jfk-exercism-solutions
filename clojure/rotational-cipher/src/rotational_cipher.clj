(ns rotational-cipher)

(defn char-range [start end]
  (map char (range (int start)
                   (inc (int end)))))

(defn rot [n s]
  (concat (nthrest s n) (take n s)))

(defn cipher-mapping [n]
  (let [alphabet-lower (char-range \a \z)
        alphabet-upper (char-range \A \Z)]
        (merge (zipmap alphabet-lower
                       (rot n alphabet-lower))
               (zipmap alphabet-upper
                       (rot n alphabet-upper)))))

(defn map-or-leave [mapping element]
  (if (contains? mapping element)
    (mapping element)
    element))

(defn rotate [s n]
  (let [normalized-n (mod n 26)
        mapping (cipher-mapping normalized-n)
        rotated (map (partial map-or-leave mapping) s)]
    (apply str rotated)))
