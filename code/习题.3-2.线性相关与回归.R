# Sat Sep 30 00:37:16 2023 ------------------------------
library(rio)
library(purrr)
library(rstatix)

df = import("dataset/习题.3-2.住院天数与预后指数的预测模型.csv")
df

# 正态性检验
df %>%
  select(住院天数, 预后指数) %>%
  map_dfr(shapiro_test, .id = "数据")

# 相关性分析
df %>%
  cor_test(住院天数, 预后指数)
