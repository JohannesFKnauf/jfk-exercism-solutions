(import (rnrs))

(define (transcribe nucleotide)
  (case nucleotide
   ((#\G) #\C)
   ((#\C) #\G)
   ((#\T) #\A)
   ((#\A) #\U)))

(define (dna->rna dna)
  (string-map transcribe dna))

