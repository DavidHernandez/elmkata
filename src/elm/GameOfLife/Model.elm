module GameOfLife.Model exposing (..)


type alias Cell =
    { neighbours : Neighbours
    , state : State
    }


type alias State =
    Bool


type alias Neighbours =
    List Neighbour


type alias Neighbour =
    Bool


baseNeighbours : Neighbours
baseNeighbours =
    [ False, False, False, False, False, False, False, False ]


oneCellNeighbour : Neighbours
oneCellNeighbour =
    [ True, False, False, False, False, False, False, False ]


twoCellNeighbours : Neighbours
twoCellNeighbours =
    [ True, True, False, False, False, False, False, False ]


baseCell : Cell
baseCell =
    { neighbours = baseNeighbours
    , state = False
    }


oneNeighbour : Cell
oneNeighbour =
    { neighbours = oneCellNeighbour
    , state = False
    }


twoNeighbours =
    { neighbours = twoCellNeighbours
    , state = True
    }
