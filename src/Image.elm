module Image exposing (Image, buildImage, randomGenerator)

import Random


type alias Image =
    { id : Int
    , url : String
    , description : String
    }


randomGenerator : Int -> Int -> Random.Generator Int
randomGenerator min max =
    Random.int min max


buildImage : Int -> Image
buildImage id =
    { id = id
    , url = "https://picsum.photos/300/?image=" ++ String.fromInt id
    , description = String.fromInt id
    }
