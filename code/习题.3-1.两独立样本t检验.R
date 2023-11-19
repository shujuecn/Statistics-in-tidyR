# Fri Sep 29 22:38:58 2023 ------------------------------
library(rio)
library(rstatix)

df = import("dataset/习题.3-1.两组舒张压降压效果.csv")

# 正态性检验
df %>%
  group_by(组别) %>%
  shapiro_test(降压值)

# 方差齐性检验
df %>%
  levene_test(降压值 ~ 组别)

# 独立样本t检验
df %>%
  t_test(降压值 ~ 组别, paired = FALSE)
