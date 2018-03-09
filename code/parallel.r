theList <- list(A=1:100, B=c(3, 7, 4), C=5, D=23:38)

library(purrr)
map(theList, sum)

library(doParallel)

detectCores()

cl <- makeCluster(3)
cl

registerDoParallel(cl)

foreach(a=theList) %dopar%
{
    sum(a)
}

startTime <- Sys.time()
foreach(a=theList, .combine=c) %dopar%
{
    sum(a)
}
endTime <- Sys.time()
endTime - startTime

# microbenchmark

foreach(a=theList, .combine=c, .multicombine=TRUE) %dopar%
{
    sum(a)
}

foreach(a=theList, .combine=c, .multicombine=TRUE, .inorder=FALSE) %dopar%
{
    sum(a)
}

foreach(a=theList, .packages=c('dplyr', 'purrr')) %dopar%
{
    sum(a)
}

map(theList, sum)
lapply(theList, FUN=sum)

parLapply(cl=cl, theList, fun=sum)

# install.packages('devtools')
# devtools::install_github('hadley/multidplyr')

library(dplyr)
library(multidplyr)

data(diamonds, package='ggplot2')

diamonds %>% 
    group_by(cut) %>% 
    summarize(Price=mean(price))

diamonds %>% 
    partition(cut) %>% 
    summarize(Price=mean(price))

models <- diamonds %>% 
    partition(cut) %>% 
    do(Model=lm(price ~ carat, data=.)) %>% 
    collect()

models

models$Model[[1]]

library(coefplot)
coefplot(models$Model[[1]])
multiplot(models$Model)

stopCluster(cl)
