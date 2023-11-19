# Fri Sep 29 17:03:57 2023 ------------------------------
library(tibble)
library(dplyr)

n = 40 # 样本数
process = 4 # 处理组数

set.seed(123)
df = tibble(
  `编号` = 1:n,
  `体重` = sample(300:800, n)
)
df

if (n %% process != 0) {
  cat("非完全随机区组设计！\n")
  group = NULL
} else {
  group = n / process # 区组数

  set.seed(123)
  df %>%
    arrange(`体重`) %>%
    mutate(`区组` = rep(1:group, each = process)) %>%
    group_by(`区组`) %>%
    sample_n(process) %>%
    mutate(`处理` = rep(LETTERS[1:process])) %>%
    ungroup()
}
