(define (domain AKARI)
    (:requirements :strips)
    (:types xpos ypos num)
    (:predicates 
        (increment ?n1 ?n2 - num)
        (adjacent ?x - xpos ?y - ypos ?x2 - xpos ?y2 - ypos)
        (right ?x1 ?x2 - xpos)
        (below ?y1 ?y2 - ypos)
        (left ?x1 ?x2 - xpos)
        (above ?y1 ?y2 - ypos)
        (lit ?x - xpos ?y - ypos)
        (dark ?x - xpos ?y - ypos)
        (surrounded ?x - xpos ?y - ypos ?n - num)
    )
    
    (:action place-bulb
        :parameters (?x1 - xpos ?y1 - ypos)
        :precondition (
                 and (not (dark ?x1 ?y1))
                    (not (lit ?x1 ?y1))
                )
        :effect (
                and
                    (lit ?x1 ?y1)
                    (forall (?x2 - xpos ?y2 - ypos ?n1 ?n2 - num)
                        (when
                            (and (adjacent ?x1 ?y1 ?x2 ?y2) (dark ?x2 ?y2) (surrounded ?x2 ?y2 ?n1) (increment ?n1 ?n2))
                            (and (not (surrounded ?x2 ?y2 ?n1)) (surrounded ?x2 ?y2 ?n2))
                        )
                    )
                       ;light all the cells above the current cell except the dark cells
                    (forall (?y - ypos)
                        (when
                            (and (above ?y ?y1) (not (dark ?x1 ?y)) (not (exists (?y2 - ypos) (and (dark ?x1 ?y2) (below ?y2 ?y) (below ?y1 ?y2)) ))  ) 
                            (and (lit ?x1 ?y))
                        )
                    )
                    ;light all the cells below the current cell except the dark cells
                    (forall (?y - ypos)
                        (when
                            (and (below ?y ?y1) (not (dark ?x1 ?y)) (not (exists (?y2 - ypos) (and (dark ?x1 ?y2) (above ?y2 ?y) (above ?y1 ?y2)) )) ) 
                            (and (lit ?x1 ?y))
                        )
                    )
                    ;light all the cells left of the current cell except the dark cells
                    (forall (?x - xpos)
                        (when
                            (and (left ?x ?x1) (not (dark ?x ?y1)) (not (exists (?x2 - xpos) (and (dark ?x2 ?y1) (right ?x2 ?x) (right ?x1 ?x2)) )) ) 
                            (and (lit ?x ?y1))
                        )
                    )
                     ;light all the cells right of the current cell except the dark cells
                    (forall (?x - xpos)
                        (when
                            (and (right ?x ?x1) (not (dark ?x ?y1)) (not (exists (?x2 - xpos) ( and(dark ?x2 ?y1) (left ?x2 ?x) (left ?x1 ?x2)) )) ) 
                            (and (lit ?x ?y1))
                        )
                    )
                    
                  
                )
    ) 
)