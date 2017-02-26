(defvar *edges* '( ( living-room (garden west door) (attic upstairs ladder))
(garden (living-room east door)) (attic  (living-room downstairs ladder))))

;; notice the back-tic to note this is string interpolation
;; backticks and commas flip-flop from data/code mode
(defun describe-path (edge)
    `(there is a ,(caddr edge) going ,(cadr edge) from here. ))

;; map over each edge and return list of description. Apply 'append to our map
;; and append all description into one large list
(defun describe-paths (location edges)
   (apply #'append (mapcar #'describe-path (cdr assoc location edges))))

;; list of all objects
(defparameter *objects* '(whiskey bucket frog chain))

;; alist of various objects and their locations
;; alist - a list of pairs ( (pairs) (pairs .. )
(defparameter *object-locations* '( (whiskey living-room) (bucket living-room)
                                    (chain garden) (frog garden)))
;; list objects from a given location
;; pass in list of all objects, list of all object locations
;; return list of all objects at a specified location.
;; could likely generate list of objects from objs-locs

(defun objects-at (loc objs obj-locs)
   (labels ((at-loc-p(obj)
         (eq (cadr  (assoc obj obj-locs)) loc)))
   (remove-if-not #'at-loc-p objs)))
