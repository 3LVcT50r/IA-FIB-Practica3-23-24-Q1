(define (domain libros)

    (:requirements :strips :adl :typing) 

    (:types
        libro - object
        mes - object
    )

    (:predicates
        (predecesor ?l1 - libro ?l2 - libro) ;primero el l1 y despues l2
        (leido ?l1 - libro)
        (quiere ?l1 - libro)
        (asignado ?l1 - libro ?m1 - mes)
        (mes-anterior ?m1 - mes ?m2 - mes)      ;m2 anterior a m1
    )

    (:action leer-predecesor
        :parameters (?l - libro ?m - mes)
        :precondition (and 
                        ;(quiere ?l)
                        (not (leido ?l))
                        (exists (?pred - libro) 
                            (imply (predecesor ?pred ?l) (and (leido ?pred)
                                (forall (?m-anterior - mes) 
                                    (imply (asignado ?pred ?m-anterior) 
                                        (mes-anterior ?m ?m-anterior)))
                            ))
                        )
                    )
        :effect (and 
                    (leido ?l)
                    (not (quiere ?l))
                    (asignado ?l ?m)
                )
    )
)
