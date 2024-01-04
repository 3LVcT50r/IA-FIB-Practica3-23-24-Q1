(define (problem problema) 

    (:domain libros)

    (:objects
        enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre - mes
        libro1 libro2 libro3 libro4 - libro
    )    

    (:init

        (mes-anterior enero febrero)
        (mes-anterior febrero marzo)
        (mes-anterior marzo abril)
        (mes-anterior abril mayo)
        (mes-anterior mayo junio)
        (mes-anterior junio julio)
        (mes-anterior julio agosto)
        (mes-anterior agosto septiembre)
        (mes-anterior septiembre octubre)
        (mes-anterior octubre noviembre)
        (mes-anterior noviembre diciembre)

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
        (quiere libro4)
        (predecesor libro1 libro2)
        (predecesor libro2 libro3)
        (predecesor libro3 libro4)
        ;(paralelo libro2 libro3)
    )

    (:goal
        (forall (?l - libro) (leido ?l))
    )
)