(ns protein-translation)

(def proteins
  {["AUG"] "Methionine"
   ["UUU" "UUC"] "Phenylalanine"
   ["UUA" "UUG"] "Leucine"
   ["UCU" "UCC" "UCA" "UCG"] "Serine"
   ["UAU" "UAC"] "Tyrosine"
   ["UGU" "UGC"] "Cysteine"
   ["UGG"] "Tryptophan"
   ["UAA" "UAG" "UGA"] "STOP"})

(def codon->protein
  (into {} (mapcat identity (for [[codons protein] proteins]
                              (for [codon codons]
                                [codon protein])))))


(defn translate-codon [codon]
  (codon->protein codon))

(defn translate-rna [rna]
  (->> rna
       (partition 3)
       (map (partial apply str))
       (map translate-codon)
       (take-while (partial not= "STOP"))))
