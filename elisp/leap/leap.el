;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:
(defun divisible-by-p (d a)
  (zerop (% a d)))

(defun leap-year-p (year)
  "Check if a given year is a leap year."
  (cond ((divisible-by-p 400 year) t)
	((divisible-by-p 100 year) nil)
	((divisible-by-p 4 year) t)
	(t nil)))

(provide 'leap)
;;; leap.el ends here
