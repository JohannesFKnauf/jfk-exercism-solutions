(ns secret-handshake)

(defn contains-bit? [n bit]
  (not (zero? (bit-and n (bit-shift-left 1 bit)))))

(def code-ops
  [#(conj % "wink")
   #(conj % "double blink")
   #(conj % "close your eyes")
   #(conj % "jump")
   reverse])

(defn bit-encoder [n]
  (fn encode-bit [acc [i op]]
    (if (contains-bit? n i)
      (op acc)
      acc)))

(defn commands [n]
  (->> code-ops
       (map-indexed vector)
       (reduce (bit-encoder n) [])))
