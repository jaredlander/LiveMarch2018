library(jsonlite)

pizza <- fromJSON('data/FavoriteSpots.json')
pizza
pizza$Details
pizza$Coordinates
pizza
class(pizza)
class(pizza$Name)
class(pizza$Details)
class(pizza$Details[[1]])
pizza$Details[[1]]

pizza <- fromJSON('data/FavoriteSpots.json') %>% tidyr::unnest()
pizza
pizza$Zip

library(leaflet)

leaflet(pizza) %>% 
    addTiles() %>% 
    addMarkers(
        lng= ~ longitude,
        lat= ~ latitude,
        popup= ~ Name
    )
