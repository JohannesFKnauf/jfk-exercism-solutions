(ns rna-transcription)

(defn transcribe-nucleutide [nucleotide]
  (case nucleotide
      \G \C
      \C \G
      \T \A
      \A \U
      (->> nucleotide
           (str "Invalid nucleutide:")
           (AssertionError.)
           (throw))))
   

(defn to-rna [dna]
  (->> dna
       (map transcribe-nucleutide)
       (apply str)))
