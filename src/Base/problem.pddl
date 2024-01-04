(define (problem problema) 

    (:domain libros)

    (:objects
        enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre - mes
        libro1 libro2 libro3 libro4 - libro
    )    

    (:init
        (ordenmes enero febrero)
        (ordenmes febrero marzo)
        (ordenmes marzo abril)
        (ordenmes abril mayo)
        (ordenmes mayo junio)
        (ordenmes junio julio)
        (ordenmes julio agosto)
        (ordenmes agosto septiembre)
        (ordenmes septiembre octubre)
        (ordenmes octubre noviembre)
        (ordenmes noviembre diciembre)

        (= (pag-por-mes enero) 0)
        (= (pag-por-mes febrero) 0)
        (= (pag-por-mes marzo) 0)
        (= (pag-por-mes abril) 0)
        (= (pag-por-mes mayo) 0)
        (= (pag-por-mes junio) 0)
        (= (pag-por-mes julio) 0)
        (= (pag-por-mes agosto) 0)
        (= (pag-por-mes septiembre) 0)
        (= (pag-por-mes octubre) 0)
        (= (pag-por-mes noviembre) 0)
        (= (pag-por-mes diciembre) 0)


        (quiere libro1)
        (quiere libro2)
        (quiere libro3)
        (leido libro4)
        (predecesor libro1 libro2)
        (paralelo libro2 libro3)
    )

    (:goal
        (forall (?l - libro) (leido ?l))
    )
)