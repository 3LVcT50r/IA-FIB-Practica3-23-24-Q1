(define (domain libros)

    (:requirements :strips :adl :typing :equality :fluents) 

    (:types
        libro - object
        mes - object
    )

    (:predicates
        (predecesor ?l1 - libro ?l2 - libro) ;primero el l1 y despues l2
        (paralelo ?l1 - libro ?l2 - libro)
        (leido ?l1 - libro)
        (quiere ?l1 - libro)
        (asignado ?l1 - libro ?m1 - mes)
        (mes-anterior ?m1 - mes ?m2 - mes)      ;m2 anterior a m1
        (mes-anterior-p ?m1 - mes ?m2 - mes)    ;m1 anterior a m2
    )

    (:functions
        (pag-por-mes ?m - mes)
        (pag-libro ?l - libro)
    )

    (:action leer
        :parameters (?l - libro ?m - mes)
        :precondition (and 
                        (< (pag-por-mes ?m) 800)
                        (not (leido ?l))
                        (forall (?pred - libro) 
                            (imply (predecesor ?pred ?l) (and (leido ?pred)
                                (forall (?m-anterior - mes) 
                                    (imply (asignado ?pred ?m-anterior) 
                                        (mes-anterior ?m ?m-anterior)))
                            ))
                        )
                        (exists (?par - libro)
                            (imply (and (leido ?par) (or (paralelo ?par ?l) (paralelo ?l ?par)))
                                (and 
                                    (leido ?par)
                                    (forall (?ma - mes)
                                        (imply (asignado ?par ?ma)
                                            (or
                                                (mes-anterior-p ?ma ?m)
                                                (mes-anterior-p ?m ?ma)
                                                (= ?ma ?m)
                                            )
                                        )
                                    )
                                )
                            )
                        )

                    )
        :effect (and 
                    (leido ?l)
                    (not (quiere ?l))
                    (asignado ?l ?m)
                    (increase (pag-por-mes ?m) (pag-libro ?l))
                )
    )

    (:action leer-pa
        :parameters (?l - libro ?m - mes)
        :precondition (and 
                        (not (leido ?l))
                        ;(quiere ?l)
                        (< (pag-por-mes ?m) 800)
                        (forall (?pred - libro) 
                            (imply (predecesor ?pred ?l) (and (leido ?pred)
                                (forall (?m-anterior - mes) 
                                    (imply (asignado ?pred ?m-anterior) 
                                        (mes-anterior ?m ?m-anterior)))
                            ))
                        )
                        (forall (?par - libro)
                            (imply (or (paralelo ?par ?l) (paralelo ?l ?par))
                                (not (leido ?par))
                            )
                        )
                    ) 
        :effect (and 
                    (leido ?l)
                    (not (quiere ?l))
                    (asignado ?l ?m)
                    (increase (pag-por-mes ?m) (pag-libro ?l))
                
                )
    )
    
)