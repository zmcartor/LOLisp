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

(defun describe-location (location nodes)
  (cadr ( assoc location nodes )))
;; list of all objects
(defparameter *objects* '(whiskey bucket frog chain))

(defparameter *nodes* '( (living-room ( you are in the living room. A wizard snores
  on the couch)) (garden (you are in the garden. There is a well.)) ( attic (you are
in the attic. A torch in the corner.))))

;; alist of various objects and their locations
;; alist - a list of pairs ( (pairs) (pairs .. )
(defparameter *object-locations* '( (whiskey living-room) (bucket living-room)
                                    (chain garden) (frog garden)))
;; list objects from a given location
;; pass in list of all objects, list of all object locations
;; return list of all objects at a specified location.
;; run through each item, and see if it matches the location.
;; objects-locations is stored as an alist.

(defun objects-at (loc objs obj-locs)
   (labels ((at-loc-p(obj)
         (eq (cadr  (assoc obj obj-locs)) loc)))
   (remove-if-not #'at-loc-p objs)))

;; describe objects in front of you
;; grab all of the objects at a given location. apply function
;; to describe each one, concat up descriptions.
(defun describe-objects (loc objs objs-locs)
  (labels ((describe-obj (obj)
           `(you see a ,obj on the floor.)))
  (apply #'append (mapcar #'describe-obj (objects-at loc objs objs-loc)))))


;; global var to track where we are at moment
(defparameter *location* 'living-room)

;; describe where we are , the paths in/out, and objects within this location
(defun look ()
(append   (describe-location *location* *nodes*)
          (describe-paths *location* *edges*)
          (describe-objects *location* *objects* *objects-locations*)))
