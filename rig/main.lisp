;;;; 2013-02-05 16:02:09
;;;; Behold, the power of lisp.

;(in-package :rig)

; my first stab at making my own Lisp engine

; (defparameter *al-table* 0) ; have a table for alignment

;(defparameter *al* '((Order (Lawful Neutral Chaotic))
;                     (Morals (Good Neutral Evil)))) ; I feel like there's a better data structure for this.
; maybe an array?  I'd prefer an array.

(defun die (sides) ; roll a die!
  (+ 1 (random sides)))

(defun d18 ()
  "3 to 18"
  (+ (random 5) (die 4) (die 4) (die 6)))


(defparameter al (make-array 9 ; this is a vector - the nine is a number of elements in a dimension, but I can add multiple values in a list for a multidimensional array
                             :initial-contents ; this is the only way to have it start containing things
                             '((Lawful_Evil) ; and you can't expand / subtract the size of the array
                               (Lawful_Neutral) ; there's a function called 'vector' that just creates a vector, too
                               (Lawful_Good)
                               (Neutral_Evil)
                               (True_Neutral)
                               (Neutral_Good)
                               (Chaotic_Evil)
                               (Chaotic_Neutral)
                               (Chaotic_Good)))) ; weird.  You can't just declare an array - you make one with a function

(defparameter available-classes (make-array 20
                                            :initial-contents
                                            '((*barbarian*)(*bard*)(*cleric*)(*druid*)(*fighter*)(*monk*)(*paladin*)(*ranger*)(*rogue*)(*sorceror*)(*wizard*)(*psion*)(*psywar*)(*soulknife*)(*wilder*)(*adept*)(*aristocrat*)(*commoner*)(*expert*)(*warrior*))))

(defparameter *hcls* (make-hash-table))
; genetic setter: (setf (gethash 'foo *cls*) '25))

(setf (gethash 'adept *hcls*) '((bab . full)(hp . 6)(sp . 2)(fort . bad)(ref . bad)(will . good))) ; wait - is there no other way to make a CL hashtable? lame.


(defstruct cls ; this would be a class in any other language
  name
  hp
  bab
  fort
  ref
  will
  sp)

(defparameter *adept* (make-cls :name "Adept" ; this is an instance of an object.  make-cls is a constructor.
                                :hp 6 ; CL also creates methods to get each of these values automatically
                                :bab 'poor ; e.g.: (cls-bab *adept*) returns POOR
                                :fort 'bad
                                :ref 'bad
                                :will 'good
                                :sp 2))
;(defparameter *aristocrat* #S(cls :name "Aristocrat" :hp 8 :bab 'avg :fort 'good :ref 'bad :will 'good :sp 4)) ; throws a error on save, but does seem to mostly work.

(defparameter *aristocrat* (make-cls :name "Aristocrat" :hp 8 :bab 'avg :fort 'good :ref 'poor :will 'good :sp 4))


(defparameter *commoner* (make-cls :name "Commoner0" :hp 4 :bab 'half :fort 'poor :ref 'poor :will 'poor :sp 2))

(defparameter *expert* (make-cls :name "Expert"
                                 :hp 6
                                 :bab 'half
                                 :fort 'poor
                                 :ref 'poor
                                 :will 'good
                                 :sp 6))

(defparameter *warrior* (make-cls :name "Warrior"
                                  :hp 8
                                  :bab 'full
                                  :fort 'good
                                  :ref 'poor
                                  :will 'poor
                                  :sp 2))

(defparameter *soulknife* (make-cls :name "Soulknife"
                                 :hp 10
                                 :bab 'avg
                                 :fort 'poor
                                 :ref 'good
                                 :will 'good
                                 :sp 4))

(defparameter *psywar* (make-cls :name "Psychic Warrior"
                                 :hp 8
                                 :bab 'avg
                                 :fort 'good
                                 :ref 'poor
                                 :will 'poor
                                 :sp 2))

(defparameter *psion* (make-cls :name "Psion"
                                :hp 4
                                :bab 'half
                                :fort 'poor
                                :ref 'poor
                                :will 'good
                                :sp 2))

(defparameter *wilder* (make-cls :name "Wilder"
                                 :hp 6
                                 :bab 'avg
                                 :fort 'poor
                                 :ref 'poor
                                 :will 'good
                                 :sp 4))

(defparameter *barbarian* (make-cls :name "Barbarian"
                                    :hp 12
                                    :bab 'full
                                    :fort 'good
                                    :ref 'poor
                                    :will 'poor
                                    :sp 4))

(defparameter *bard* (make-cls :name "Bard"
                               :hp 6
                               :bab 'avg
                               :fort 'poor
                               :ref 'good
                               :will 'good
                               :sp 6))

(defparameter *cleric* (make-cls :name "Cleric"
                                 :hp 8
                                 :bab 'avg
                                 :fort 'good
                                 :ref 'poor
                                 :will 'good
                                 :sp 2))

(defparameter *druid* (make-cls :name "Druid"
                                :hp 8
                                :bab 'avg
                                :fort 'good
                                :ref 'poor
                                :will 'good
                                :sp 4))

(defparameter *fighter* (make-cls :name "Fighter"
                                  :hp 10
                                  :bab 'full
                                  :fort 'good
                                  :ref 'poor
                                  :will 'poor
                                  :sp 2))

(defparameter *monk* (make-cls :name "Monk"
                               :hp 8
                               :bab 'avg
                               :fort 'good
                               :ref 'good
                               :will 'good
                               :sp 4))

(defparameter *paladin* (make-cls :name "Paladin"
                                  :hp 10
                                  :bab 'full
                                  :fort 'good
                                  :ref 'poor
                                  :will 'good
                                  :sp 2))

(defparameter *ranger* (make-cls :name "Ranger"
                                 :hp 8
                                 :bab 'full
                                 :fort 'good
                                 :ref 'poor
                                 :will 'good
                                 :sp 6))

(defparameter *rogue* (make-cls :name "Rogue" :hp 6 :bab 'avg :fort 'good :ref 'good :will 'poor :sp 8))

(defparameter *sorcerer* (make-cls :name "Sorceror" :hp 4 :bab 'half :fort 'poor :ref 'poor :will 'good :sp 2))

(defparameter *wizard* (make-cls :name "Wizard" :hp 4 :bab 'half :fort 'poor :ref 'poor :will 'good :sp 2))

; person stats
(defparameter *abils* (make-hash-table)) ; shouldn't be an array
(defparameter *career* '(nil . nil))
(defparameter *hp* 0)
(defparameter *alignment* nil)
(defparameter *saves* '((fort . nil)(ref . nil)(will . nil)))
(defparameter *size* 0) ; medium
; something for skills - but what data structure works best?
; (defparameter *feats* nil)
; atk - bab . grp
; person ends

(defun goodsv (lvl)
  "a good saving throw"
  ; f(x) = 0.5x + 2
  (+ (floor (* lvl 1/2)) 2))

(defun poorsv (lvl)
  "a poor saving throw"
  ; f(x) = (1/3)x
  (floor (* lvl 1/3)))

(defun svis (your-class sv lvl)
  "gives the base save for a given class and level"
  (case sv
        ((fort) (if (eq 'good (cls-fort your-class))
                    (goodsv lvl)
                    (poorsv lvl)))
        ((ref) (if (eq 'good (cls-ref your-class))
                    (goodsv lvl)
                    (poorsv lvl)))
        ((will) (if (eq 'good (cls-will your-class))
                    (goodsv lvl)
                    (poorsv lvl)))))

(defun applylvls (lvl)
  "one of the main functions, applies a new level to the character"
  (let* ((hip (+ (die (cls-hp (car *career*))) 
                 (abilmod (gethash 'con *abils*))))
         (fort (svis (car *career*) 'fort lvl)) ; how is this malformed?  I don't understand.
         (reflex (svis (car *career*) 'ref lvl))
         (will (svis (car *career*) 'will lvl)))
    )
  )

(defun abilmod (score)
  "calculates a d20 3.5 ability modifier"
  ; f(x) = 0.5x - 5
  (- (floor (* score 1/2)) 5))

(defun show-abils ()
  "a shortcut to see the contents of hashtable *abils*"
  (princ (gethash 'ste *abils*))
  (princ '-)
  (princ (gethash 'dex *abils*))
  (princ '-)
  (princ (gethash 'con *abils*))
  (princ '-)
  (princ (gethash 'ine *abils*))
  (princ '-)
  (princ (gethash 'wis *abils*))
  (princ '-)
  (princ (gethash 'cha *abils*)))

(defun gen-abils (&key smod dmod cmod imod wmod hmod)
  "generates d20 ability scores"
  (let* ((strength (if (eq smod nil) (d18) ; if then
                       (+ smod (d18)))) ; else
         (dexterity (if (eq dmod nil) (d18)
                        (+ dmod (d18))))
         (constitut (if (eq cmod nil) (d18)
                        (+ cmod (d18))))
         (intellige (if (eq imod nil) (d18)
                        (+ imod (d18))))
         (wisdom (if (eq wmod nil) (d18)
                        (+ wmod (d18))))
         (charisma (if (eq hmod nil) (d18)
                        (+ hmod (d18)))))
    (setf (gethash 'ste *abils*) strength)
    (setf (gethash 'dex *abils*) dexterity)
    (setf (gethash 'con *abils*) constitut)
    (setf (gethash 'ine *abils*) intellige)
    (setf (gethash 'wis *abils*) wisdom)
    (setf (gethash 'cha *abils*) charisma)))

(defun gen-cls () ; should eventually have an optional arg for presupplied class
  "randomly picks a random d20 class"
  (setf (car *career*) (aref available-classes (random 20)))) ; should eventually actually interoperate with the objects

(defun gen-lvl () ; should eventually take keyword args for presupplied level or ranges of levels
  "randomly picks a class level"
  (setf (cdr *career*) (1+ (random 21))))

(defun gen-al (&optional align) ; add a keyword option to forbid certain alignments using recursion
  "semi-randomly picks a d20 alignment"
   (setf *alignment* (case align
                           ((LE) '(Lawful_Evil))
                           ((NE) '(Neutral_Evil))
                           ((CE) '(Chaotic_Evil))
                           ((LN) '(Lawful_Neutral))
                           ((TN) '(True_Neutral))
                           ((CN) '(Chaotic_Neutral))
                           ((LG) '(Lawful_Neutral))
                           ((NG) '(Neutral_Good))
                           ((CG '(Chaotic_Good)))
                           (otherwise (aref al (random 9))))))

(defun gen-ppl () ; need to complete this.  And also accept keyword args for banned species or a specific species
  "semi-randomly picks a d20 race"
  ())

#|
(defun diepool (num sides) ; and some &rest args
  "rolls a pool of dice"
  ))
|#
