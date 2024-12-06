;; Advent of Code 2024 Day 1
;; Caelan Burris

(defmacro with-input-lines ((line-var stream) &body body)
  `(loop :for ,line-var = (read-line ,stream nil)
         :while ,line-var
         :do (progn ,@body)))

(defun read-lists (count input)
  (let ((lists (make-array (list count) :initial-element nil)))
    (print (type-of lists))
    (with-input-lines (line input)
      (let ((next-field 0))
        (dotimes (k count)
          (multiple-value-bind (field field-end)
              (parse-integer line :start next-field :junk-allowed t)
            (push field (aref lists k))
            (setf next-field field-end)))))
    (map 'list #'nreverse lists)))

(defun read-sorted-lists (count input)
  (mapcar (lambda (list) (sort list #'<))
          (read-lists count input)))

(defun distances (lists)
  (mapcar #'abs (apply #'mapcar #'- lists)))

(defun sum (list)
  (reduce #'+ list :initial-value 0))

(defun part-1 (input-path)
  (with-open-file (input input-path)
    (sum (distances (read-sorted-lists 2 input)))))
