# Tue Sep 19 11:58:08 2023 ------------------------------
library(tibble)
library(sjmisc)

set.seed(123)
df = tibble(`红细胞数` = sample(400:600, 120))
df

# 方法一
df %>%
  mutate(new = case_when(
    `红细胞数` <= 440 ~ 1,
    `红细胞数` > 440 & `红细胞数` < 520 ~ 2,
    `红细胞数` >= 550 ~ 3,
    TRUE ~ NA_real_  # 使用NA_real_表示默认值
  ))

# 方法二（对于440的处理有问题）
df %>%
  rec(`红细胞数`, rec = "min:440=1; 440:520=2; 550:max=3") %>%
  rename("new" = `红细胞数_r`)

# 方法三
df %>%
  mutate(new = if_else(`红细胞数` <= 440, 1, if_else(`红细胞数` > 440 & `红细胞数` < 520, 2, if_else(`红细胞数` >= 550, 3, NA))))
