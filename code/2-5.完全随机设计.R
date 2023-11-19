# Tue Sep 19 19:30:31 2023 ------------------------------
library(tibble)

df = tibble(ID = 1:15)

# 先生成分组索引，再打乱顺序
df %>%
  mutate(group = sample(rep(c("A", "B", "C"), 5)))
