(defparameter *big* 100)
(defparameter *small* 1)

(defun guess-my-number()
  (ash ( + *small* *big*) -1 ))

;; we know that number will be one less than the largest number. subtract one, and recalc guess
;; guess is always midpoint between big and small

(defun smaller ()
  (setf *big* ( 1- (guess-my-number)))
  (guess-my-number))

(defun bigger ()
  (setf *small* ( 1+ (guess-my-number)))
  (guess-my-number))

(defun start-over ()
  (setf *big* 100)
  (setf *small* 1)
  (guess-my-number))

;; let () declare local variables in a block and use them withing the block
;; flet declare local functions and use within that block
;; global functions defined through defun
;; labels defines function like flet, but funcs can call themselves.
;;    good for recursion!
