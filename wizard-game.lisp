(defvar *edges* '( ( living-room (garden west door) (attic upstairs ladder))
(garden (living room east door)) (attic  (living-room downstairs ladder))))

;; notice the back-tic to note this is string interpolation
;; backticks and commas flip-flop from data/code mode
(defun describe-path (edge)
    `(there is a ,(caddr edge) going ,(cadr edge) from here. ))

;; map over each edge and return list of description. Apply 'append to our map
;; and append all description into one large list
(defun describe-paths (location edges)
   (apply #'append (mapcar #'describe-path (cdr assoc location edges))))
