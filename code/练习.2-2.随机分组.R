# Tue Sep 19 20:04:25 2023 ------------------------------
library(tibble)

df = tibble(ID = 1:24)
df

# 随机分组
df %>%
  mutate(group = sample(rep(c("A", "B", "C", "D"), 6)))
