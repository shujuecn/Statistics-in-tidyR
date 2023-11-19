# Tue Sep 19 18:37:20 2023 ------------------------------
library(stringr)
library(tidyr)

df = tibble(
  `社区代码` = 1:1820,
  `社区名称` = expand.grid(LETTERS, 1:70) %>% unite(col = "new") %>% pull,
  `所属街道` = rep(1:168, each = 10)[1:1820],
  `所属区县` = rep(letters, each = 70)
)
df

# 1.第一阶段：按比例分层抽样 ------------------------------

df %>%
  group_by(所属区县) %>%
  summarise(n = n())

# 2.第二阶段：随机抽样 ------------------------------


