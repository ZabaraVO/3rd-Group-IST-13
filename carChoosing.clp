;;****************
;;* DEFFUNCTIONS *
;;****************

(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(deffunction ask-about-price()
	(bind ?answer (ask-question "Auaa?eoa oaiiaie aeaiacii. 1: ai 1 iei.; 2: io 1 ai 3 iei.; 3: aieuoa 3 iei.: " 1 2 3))
	?answer
)

(deffunction ask-about-manufacturer()
	(bind ?answer (ask-question "Aai io?ai ioa?anoaaiiue aaoiiiaeeu eee eiiia?ea? 1: ioa?anoaaiiue; 2: eiiia?ea: " 1 2))
	?answer
)

(deffunction ask-about-seats(?allowed-values-str $?allowed-values)
	(bind ?question (str-cat "Auaa?eoa i?aaii?eoaaiia eiee?anoai iano. " ?allowed-values-str ": "))
	(bind ?answer (ask-question ?question ?allowed-values))
	?answer
)

(deffunction ask-about-speed()
	(bind ?answer (ask-question "E?aeoa ee au auno?o? acao? 1:aa; 2:iao: " 1 2))
)

(deffunction ask-about-landskape(?allowed-values-str $?allowed-values)
	(bind ?question (str-cat "Auaa?eoa ianoiinou, ii eioi?ie ieaie?oaoa ia?aiauaouny ia nai?i aaoiiiaeea. " ?allowed-values-str ": "))
	(bind ?answer (ask-question ?question $?allowed-values))
	?answer
)

(deffunction ask-about-landskape-priority(?allowed-values-str $?allowed-values)
	(bind ?question (str-cat "Auaa?eoa ianoiinou, eioi?ie aoaaoa ioaaaaou i?ei?eoao " ?allowed-values-str ": "))
	(bind ?answer (ask-question ?question $?allowed-values))
	?answer
)

(deffunction ask-about-carcase(?allowed-values-str $?allowed-values)
	(bind ?question (str-cat "Auaa?eoa oei eociaa " ?allowed-values-str ": "))
	(bind ?answer (ask-question ?question $?allowed-values))
	?answer
)

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine-price ""
	(not (price ?))
	(not (car ?))
	=>
	(assert (price (ask-about-price)))
)

(defrule determine-manufacturer1 ""
	(price 1)
	(not (manufacturer ?))
	(not (car ?))
	=>
	(assert (manufacturer (ask-about-manufacturer)))
)

(defrule determine-speed1 ""
	(manufacturer 2)
	(not (speed ?))
	(not (car ?))
	=>
	(assert (speed (ask-about-speed)))
)

(defrule determine-landskape1 ""
	(price 2)
	(not (landskape ?))
	(not (car ?))
	=>
	(assert (landskape (ask-about-landskape "1: ai?ia; 2: aiaai?i?ua; 3: ai?ia e aiaai?i?ua:" 1 2 3)))
)

(defrule determine-seats1 ""
	(landskape 3)
	(not (seats ?))
	(not (car ?))
	=>
	(assert (seats (ask-about-seats "5 eee 8" 5 8)))
)

(defrule determine-landskape-priority1 ""
	(price 2)
	(landskape 3)
	(seats 5)
	(not (landskape-priority ?))
	(not (car ?))
	=>
	(assert (landskape-priority (ask-about-landskape-priority "1: ai?ia, 2: aiaai?i?ua" 1 2)))
)

(defrule determine-speed2 ""
	(landskape 3)
	(seats 8)
	(not (speed ?))
	(not (car ?))
	=>
	(assert (speed (ask-about-speed)))
)

(defrule determine-seats2 ""
	(price 3)
	(not (seats ?))
	(not (car ?))
	=>
	(assert (seats (ask-about-seats "2 eee 5 eee 8" 2 5 8)))
)

(defrule determine-carcase1 ""
	(seats 2)
	(not (carcase ?))
	(not (car ?))
	=>
	(assert (carcase (ask-about-carcase "1: eaa?eieao; 2: eoia" 1 2)))
)

(defrule determine-landskape2 ""
	(price 3)
	(seats 8)
	(not (landskape ?))
	(not (car ?))
	=>
	(assert (landskape (ask-about-landskape "1: ai?ia; 2: aiaai?i?ua:" 1 2)))
)

(defrule determine-speed3 ""
	(seats 8)
	(landskape 2)
	(not (speed ?))
	(not (car ?))
	=>
	(assert (speed (ask-about-speed)))
)

;;;****************
;;;* CAR RULES *
;;;****************

(defrule ford-focus-3
	(price 1)
	(speed 1)
	(not (car ?))
	=>
	(assert (car "Ford Focus 3"))
)

(defrule smart
	(price 1)
	(speed 2)
	(not (car ?))
	=>
	(assert (car "Smart"))
)

(defrule uaz-patriot ""
	(manufacturer 1)
	(not (car ?))
	=>
	(assert (car "OAC Iao?eio"))
)

(defrule jeep-wrangler-sahara ""
	(price 2)
	(landskape 2)
	(not (car ?))
	=>
	(assert (car "Jeep Wrangler Sahara"))
)

(defrule jeep-grand-cherokee ""
	(landskape-priority 1)
	(not (car ?))
	=>
	(assert (car "Jeep Grand Cherokee"))
)

(defrule land-rover ""
	(landskape-priority 2)
	(not (car ?))
	=>
	(assert (car "Land Rover"))
)

(defrule toyota-sequoia ""
	(price 2)
	(speed 2)
	(not (car ?))
	=>
	(assert (car "Toyota Sequoia"))
)

(defrule mercedes-viano""
	(price 2)
	(landskape 1)
	(not (car ?))
	=>
	(assert (car "Mercedes Viano"))
)

(defrule chevrolet-traverse""
	(price 2)
	(speed 1)
	(not (car ?))
	=>
	(assert (car "Chevrolet Traverse"))
)

(defrule ferrari-california""
	(carcase 1)
	(not (car ?))
	=>
	(assert (car "Ferrari California"))
)

(defrule bugatti-veyron""
	(carcase 2)
	(not (car ?))
	=>
	(assert (car "Bugatti Veyron"))
)

(defrule chevrolet-camaro""
	(price 3)
	(seats 5)
	(not (car ?))
	=>
	(assert (car "Chevrolet Camaro"))
)

(defrule infinity-qx80""
	(price 3)
	(speed 1)
	(not (car ?))
	=>
	(assert (car "Infinity QX80"))
)

(defrule cadillac-escalade""
	(price 3)
	(landskape 1)
	(not (car ?))
	=>
	(assert (car "Cadillac Escalade"))
)

(defrule honda-pilot""
	(price 3)
	(speed 2)
	(not (car ?))
	=>
	(assert (car "Honda Pilot"))
)

;;;********************************
;;;* CONCLUSION RULE *
;;;********************************

(defrule print-car ""
  (declare (salience 10))
  (car ?item)
  =>
  (printout t crlf crlf)
  (printout t "Aai iiaoiaeo aaoiiiaeeu:")
  (printout t crlf crlf)
  (printout t ?item crlf crlf)
  )