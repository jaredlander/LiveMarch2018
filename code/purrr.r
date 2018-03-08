library(purrr)

theList <- list(1:100, c(3, 5, 2), 7, 8)
theList

theList[[1]]
theList[[2]]
theList[[3]]
theList[[4]]

sum(theList[[1]])
sum(theList[[2]])
sum(theList[[3]])
sum(theList[[4]])

map(theList, sum)
theList %>% map(sum)

theList %>% map(mean)

theList %>% map_dbl(mean)
theList %>% map_dbl(mean) %>% sum()

# this following code should give an error
theList %>% map_int(mean)

theList %>% map(class)
theList %>% map_chr(class)

secondList <- list(10:1, 5, c(1, 4, 2), 6:8)
secondList

addLengths <- function(x, y)
{
    return(length(x) + length(y))
}

addLengths(1:10, c(1, 4, 3))

addLengths(theList[[1]], secondList[[1]])
addLengths(theList[[2]], secondList[[2]])

map2(theList, secondList, addLengths)
map2_dbl(theList, secondList, addLengths)
