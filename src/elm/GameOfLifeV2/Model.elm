module GameOfLifeV2.Model exposing (..)


type alias Unit =
    { form : Form
    , dwellers : Population
    }


type Form
    = Alive
    | Dead


type alias Viability =
    Bool


type alias Population =
    Int


evaluate : Unit -> Form
evaluate unit =
    let
        willSurvive : Viability
        willSurvive =
            fitForSurvival unit.dwellers unit.form

        willReproduce : Viability
        willReproduce =
            fitForReproduction unit.dwellers
    in
        if willReproduce || willSurvive then
            Alive
        else
            Dead


fitForSurvival : Population -> Form -> Viability
fitForSurvival population form =
    let
        healthyPopulation =
            [ 2, 3 ]
    in
        (List.member population healthyPopulation && form == Alive)


fitForReproduction : Population -> Viability
fitForReproduction population =
    (population == 3)
