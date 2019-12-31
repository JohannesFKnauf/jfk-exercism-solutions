;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun canonicalize (word)
  (cl-sort (downcase word) '<))

(defun anagram-of (word)
  (lambda (candidate) (and (string= (canonicalize word)
                                    (canonicalize candidate))
                           (not (string= word
                                         candidate)))))

(defun anagrams-for (word candidates)
  (cl-remove-if-not (anagram-of word) candidates))

(provide 'anagram)
;;; anagram.el ends here
