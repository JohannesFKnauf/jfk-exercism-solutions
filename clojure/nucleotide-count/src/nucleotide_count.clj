(ns nucleotide-count)

(def nucleotides {\A 0, \T 0, \C 0, \G 0})

(defn nucleotide-counts [strand]
  {:post [(= (set (keys nucleotides)) (set (keys %)))]}
  (merge nucleotides (frequencies strand)))

(defn count [nucleotide strand]
  {:pre [(contains? nucleotides nucleotide)]}
  (get (nucleotide-counts strand) nucleotide))
