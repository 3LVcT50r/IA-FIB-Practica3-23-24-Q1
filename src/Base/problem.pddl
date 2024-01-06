(define (problem problema) 

    (:domain libros)

    (:objects
        diciembre noviembre octubre septiembre agosto julio junio mayo abril marzo febrero enero - mes
        libro1 libro2 libro3 libro4 libro5 - libro
    )    

    (:init

        (mes-anterior febrero enero)
        (mes-anterior marzo enero)(mes-anterior marzo febrero)
        (mes-anterior abril enero)(mes-anterior abril febrero)(mes-anterior abril marzo)
        (mes-anterior mayo enero)(mes-anterior mayo febrero)(mes-anterior mayo marzo)(mes-anterior mayo abril)
        (mes-anterior junio enero)(mes-anterior junio febrero)(mes-anterior junio marzo)(mes-anterior junio abril)(mes-anterior junio mayo)
        (mes-anterior julio enero)(mes-anterior julio febrero)(mes-anterior julio marzo)(mes-anterior julio abril)(mes-anterior julio mayo)(mes-anterior julio junio)
        (mes-anterior agosto enero)(mes-anterior agosto febrero)(mes-anterior agosto marzo)(mes-anterior agosto abril)(mes-anterior agosto mayo)(mes-anterior agosto junio)(mes-anterior agosto julio)
        (mes-anterior septiembre enero)(mes-anterior septiembre febrero)(mes-anterior septiembre marzo)(mes-anterior septiembre abril)(mes-anterior septiembre mayo)(mes-anterior septiembre junio)(mes-anterior septiembre julio)(mes-anterior septiembre agosto)
        (mes-anterior octubre enero)(mes-anterior octubre febrero)(mes-anterior octubre marzo)(mes-anterior octubre abril)(mes-anterior octubre mayo)(mes-anterior octubre junio)(mes-anterior octubre julio)(mes-anterior octubre agosto)(mes-anterior octubre septiembre)
        (mes-anterior noviembre enero)(mes-anterior noviembre febrero)(mes-anterior noviembre marzo)(mes-anterior noviembre abril)(mes-anterior noviembre mayo)(mes-anterior noviembre junio)(mes-anterior noviembre julio)(mes-anterior noviembre agosto)(mes-anterior noviembre septiembre)(mes-anterior noviembre octubre)
        (mes-anterior diciembre enero)(mes-anterior diciembre febrero)(mes-anterior diciembre marzo)(mes-anterior diciembre abril)(mes-anterior diciembre mayo)(mes-anterior diciembre junio)(mes-anterior diciembre julio)(mes-anterior diciembre agosto)(mes-anterior diciembre septiembre)(mes-anterior diciembre octubre)(mes-anterior diciembre noviembre)

        ;(quiere libro1)
        ;(quiere libro2)
        (quiere libro3)
        (quiere libro4)
        ;(quiere libro5)
        (predecesor libro1 libro2)
        (predecesor libro2 libro3)
        ;(predecesor libro1 libro3)
        
        ;(predecesor libro2 libro1)
        ;(predecesor libro1 libro3)
        ;(predecesor libro1 libro2)
        (predecesor libro3 libro4)

    )

    (:goal
        (forall (?l - libro) (or (leido ?l) (imply (not (leido ?l)) (not (quiere ?l)))))
    )
)
