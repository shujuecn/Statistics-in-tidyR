# Sat Sep 30 11:29:34 2023 ------------------------------
# https://mengte.online/archives/8655?pcat=6

library(rio)
library(rstatix)
library(dplyr)

df = import("dataset/7-5.填脐与敷足疗法改善失眠的交叉试验.csv")
df

# 正态性检验
df %>%
  group_by(阶段) %>%
  shapiro_test(试验结果)
df %>%
  group_by(疗法) %>%
  shapiro_test(试验结果)



df %>%
  group_by(疗法, 阶段) %>%
  mutate(id = row_number()) %>%
  ungroup() %>%
  anova_test(dv = 试验结果, wid = id, within = c(阶段, 疗法))
