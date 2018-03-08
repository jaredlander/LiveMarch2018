library(readr)

emotion <- read_tsv('data/reaction.txt')

head(emotion)

library(tidyr)

emotion %>% 
    gather(key=Type, value=Measurement, Age, BMI, React, Regulate)

emotionLong <- emotion %>% 
    gather(key=Type, value=Measurement, Age, BMI, React, Regulate)

View(emotionLong)

emotionLong %>% 
    spread(key=Type, value=Measurement)

emotionLong %>% 
    spread(key=Type, value=Measurement) %>% 
    dplyr::arrange(ID, Test)

separate
unite
