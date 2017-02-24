(defvar *simpson* nil)

;; cond will execute all statements if the first list evals to t
(defun catchphrase (character)
  (cond ( (eq character 'bart) (setf *simpson* 'bart) '(dont have a cow man) )
         ( (eq character 'homer) (setf *simpson* 'homer) '(doh!) )
         (t '(dont know that character) )
    )
  )

;; case statement can be easier to read. executes an eq but can only be
;; used on symbols, not strings.
;; otherwise runs if nothing is matched. It's like a super if-else chain
(defun case-catchphrase (character)
  (case character
          ( (bart) '(dont have a cow man) )
          (otherwise '(dont know that character) )
        )
  )
