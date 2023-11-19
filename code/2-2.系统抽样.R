# Tue Sep 19 18:05:16 2023 ------------------------------
library(tibble)

df = tibble(`编号` = 1:1000)
df

# 抽样索引
index = seq(
  from = 19, # 起始
  to = nrow(df), # 样本量
  by = nrow(df) / 50 # 抽样间隔 = 样本量 / 抽样量
)

# 抽样
df[index, ]
