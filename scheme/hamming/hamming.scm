(import (rnrs))

(define (different? nucl-a nucl-b)
  (not (equal? nucl-a
               nucl-b)))

(define (hamming-distance strand-a strand-b)
  (if (different? (string-length strand-a)
                  (string-length strand-b))
      (raise "strands have different length")
      (length
       (filter identity
               (map different?
                    (string->list strand-a)
                    (string->list strand-b))))))

