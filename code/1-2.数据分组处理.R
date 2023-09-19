# Tue Sep 19 17:52:35 2023 ------------------------------
library(rio)
library(dplyr)

df = import("./dataset/1-2.婴儿体重.csv")
df

df %>%
  group_by(`性别`) %>%
  summarise(
    `有效数` = n(),
    `缺失数` = sum(is.na(`体重`)),
    `体重均值` = mean(`体重`, na.rm = TRUE)
  )
