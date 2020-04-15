(import (rnrs))

(define (different? nucl-a nucl-b)
  (not (equal? nucl-a
               nucl-b)))

(define (hamming-distance strand-a strand-b)
  (unless (= (string-length strand-a)
             (string-length strand-b))
    (raise "strands have different length"))
   (apply + 
    (map (lambda (a b) (if (char=? a b) 0 1))
         (string->list strand-a)
         (string->list strand-b))))

