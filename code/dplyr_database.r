library(dplyr)
library(DBI)

# dbplyr

con <- dbConnect(RSQLite::SQLite(), 'data/diamonds.db')
con

dbListTables(con)
dbListFields(con, 'diamonds')

diaTab <- tbl(con, 'diamonds')
class(diaTab)
diaTab
pryr::object_size(diaTab)

diaTab %>% select(carat, price)

diaTab %>% filter(cut == 'Ideal')

diaTab %>% mutate(Ratio=price / carat)
diaTab

# Sys.getenv

# rcreds

diaTab %>% 
    group_by(cut) %>% 
    summarize(Price=mean(price))

diaTab %>% 
    group_by(cut) %>% 
    summarize(Price=AVG(price))

dbplyr::translate_sql(
    diaTab %>% 
        group_by(cut) %>% 
        summarize(Price=AVG(price))
)

colorTab <- tbl(con, 'diamondColors')
colorTab

left_join(diaTab, colorTab, by=c('color'='Color'))

diamondColors <- readr::read_csv('data/DiamondColors.csv')

left_join(diaTab, diamondColors, by=c('color'='Color'), copy=TRUE)
