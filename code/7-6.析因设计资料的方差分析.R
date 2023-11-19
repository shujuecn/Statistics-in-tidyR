# Fri Sep 29 21:15:46 2023 ------------------------------
library(rio)
library(rstatix)

df = import("dataset/7-6.黄芪注射液抑癌实验瘤重.csv")
df

# 正态性检验
df %>%
  group_by(剂量) %>%
  shapiro_test(瘤重)
df %>%
  group_by(疗程) %>%
  shapiro_test(瘤重)

# 方差分析：主效应与交互效应
df %>%
  anova_test(瘤重 ~ 剂量 * 疗程)
