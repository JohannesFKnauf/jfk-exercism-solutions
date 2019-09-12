(ns secret-handshake)

(defn contains-bit? [n bit]
  (not (zero? (bit-and n (bit-shift-left 1 bit)))))

(defn commands [n]
  (cond-> []
    (contains-bit? n 0) (conj "wink")
    (contains-bit? n 1) (conj "double blink")
    (contains-bit? n 2) (conj "close your eyes")
    (contains-bit? n 3) (conj "jump")
    (contains-bit? n 4) reverse))

