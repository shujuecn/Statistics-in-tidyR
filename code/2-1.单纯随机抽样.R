# Tue Sep 19 17:54:23 2023 ------------------------------
library(tibble)
library(dplyr)

df = tibble(`编号` = 1:50)
df

# 1.直接随机抽样 ------------------------------

# 按行数抽取
set.seed(123)
df %>% slice_sample(n = 10)

# 按比例抽取
set.seed(123)
df %>% slice_sample(prop = 0.2)

# 2.根据随机数字排序抽样 ------------------------------

set.seed(123)
df %>%
  mutate(num = rnorm(50)) %>% # 新的随机数列
  arrange(num) %>% # 排序
  .[1:10, 1] # 取前10行
