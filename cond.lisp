(defvar *simpson* nil)

;; cond will execute all statements if the first list evals to t
(defun catchphrase (character)
  (cond ( (eq character 'bart) (setf *simpson* 'bart) '(dont have a cow man) )
         ( (eq character 'homer) (setf *simpson* 'homer) '(doh!) )
         (t '(dont know that character) )
    )
  )

(catchphrase 'homer)
