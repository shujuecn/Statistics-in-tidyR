library(rio)
library(tibble)

# Tue Sep 19 17:52:51 2023 ------------------------------

df = rio::import("./dataset/1-1.E-SFC.csv") %>% tibble()
df
