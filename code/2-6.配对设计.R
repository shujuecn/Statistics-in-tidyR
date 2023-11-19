# Tue Sep 19 20:09:33 2023 ------------------------------
library(tibble)
library(dplyr)

df = tibble(
  `对号` = rep(1:8, each = 2),
  `编号` = 1:16
)
df

# 分组抽样法
set.seed(123)
df %>%
  group_by(`对号`) %>%
  sample_n(2) %>%
  mutate(`分组` = rep(c("甲", "乙"))) %>%
  arrange(desc(`分组`)) %>%
  ungroup()

# 随机数排序分组法
set.seed(123)
df %>%
  mutate(`随机数` = rnorm(nrow(.))) %>%
  group_by(`对号`) %>%
  arrange(`随机数`, .by_group = TRUE) %>%
  mutate(`分组` = rep(c("甲", "乙"))) %>%
  arrange(desc(`分组`)) %>%
  ungroup()

