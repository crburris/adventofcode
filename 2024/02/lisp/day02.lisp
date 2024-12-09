;; Advent of Code 2024 Day 2
;; Caelan Burris

(defun map-input-lines (function stream)
  (loop :for line = (read-line stream nil)
        :while line
        :collect (funcall function line)))

(defun parse-report (string)
  (do ((next-pos 0)
       (levels nil)
       (at-end nil))
      (at-end (nreverse levels))
    (multiple-value-bind (this-field field-end)
        (parse-integer string :start next-pos :junk-allowed t)
      (when this-field
        (push this-field levels)
        (setf next-pos field-end))
      (setf at-end (null this-field)))))

(defun read-reports (stream)
  (map-input-lines #'parse-report stream))

(defun level-changes (report)
  (mapcar #'- (cdr report) report))

(defun safe-report-p (report min-diff max-diff)
  (let* ((changes (level-changes report)))
    (and (every (lambda (change)
                  (and (>= change min-diff)
                       (<= change max-diff)))
                (mapcar #'abs changes))
         (or (notany #'minusp changes)
             (notany #'plusp changes)))))

(defun part-1 (input-path)
  (with-open-file (input input-path)
    (count-if (lambda (report)
                (safe-report-p report 1 3))
              (read-reports input))))
