(define (problem problema) 

    (:domain libros)

    (:objects
        diciembre noviembre octubre septiembre agosto julio junio mayo abril marzo febrero enero - mes
        ;enero febrero marzo - mes
        libro1 libro2 libro3 libro4 libro5 - libro
    )    

    (:init

        (mes-anterior-p enero febrero)
        (mes-anterior-p febrero marzo)
        (mes-anterior-p marzo abril)
        (mes-anterior-p abril mayo)
        (mes-anterior-p mayo junio)
        (mes-anterior-p junio julio)
        (mes-anterior-p julio agosto)
        (mes-anterior-p agosto septiembre)
        (mes-anterior-p septiembre octubre)
        (mes-anterior-p octubre noviembre)
        (mes-anterior-p noviembre diciembre)

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

        (= (libros-por-mes enero) 1)
        (= (libros-por-mes febrero) 1)
        (= (libros-por-mes marzo) 1)
        (= (libros-por-mes abril) 1)
        (= (libros-por-mes mayo) 1)
        (= (libros-por-mes junio) 1)
        (= (libros-por-mes julio) 1)
        (= (libros-por-mes agosto) 1)
        (= (libros-por-mes septiembre) 1)
        (= (libros-por-mes octubre) 1)
        (= (libros-por-mes noviembre) 1)
        (= (libros-por-mes diciembre) 1)

        (= (pag-libro libro1) 213)


        (quiere libro1)
        (quiere libro2)
        (quiere libro3)
        (quiere libro4)
        (quiere libro5)
        (predecesor libro1 libro2)
        (predecesor libro1 libro3)
        (predecesor libro3 libro4)
        (paralelo libro2 libro3)
        (paralelo libro4 libro2)

    )

    (:goal
        (forall (?l - libro) (or (leido ?l) (imply (not (leido ?l)) (not (quiere ?l)))))
    )

    (:metric 
        minimize 
            (+ (* (libros-por-mes enero) 1.5) 
            (+ (* (libros-por-mes febrero) 1.5)
            (+ (* (libros-por-mes marzo) 1.5)
            (+ (* (libros-por-mes abril) 1.5)
            (+ (* (libros-por-mes mayo) 1.5)
            (+ (* (libros-por-mes junio) 1.5)
            (+ (* (libros-por-mes julio) 1.5)
            (+ (* (libros-por-mes agosto) 1.5)
            (+ (* (libros-por-mes septiembre) 1.5)
            (+ (* (libros-por-mes octubre) 1.5)
            (+ (* (libros-por-mes noviembre) 1.5) 
               (* (libros-por-mes diciembre) 1.5))
            ))))))))))
    )
)