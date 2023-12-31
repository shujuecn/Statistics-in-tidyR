# Tue Sep 19 11:19:20 2023 ------------------------------
library(dplyr)

df_X = tibble(
  ID = c(1, 3, 5),
  age = c(34, 56, 34),
  height = c(167, 159, 179)
)
df_X

df_Y = tibble(
  ID = c(1, 3, 6),
  weight = c(56, 65, 66)
)
df_Y

# 1.左连接 ------------------------------

# 保留X的所有行，匹配Y的列，合并到X
df_X %>% left_join(df_Y, by = "ID")

# 2.右连接 ------------------------------

# 保留Y的所有行，匹配X的列，合并到Y
df_X %>% right_join(df_Y, by = "ID")

# 3.全连接 ------------------------------

# 保留X和Y的所有行，合并所有列
df_X %>% full_join(df_Y, by = "ID")

# 4.内连接 ------------------------------

# 保留X和Y共有的行，匹配Y的列，合并到X
df_X %>% inner_join(df_Y, by = "ID")

# 5.半连接 ------------------------------

# 保留X和Y共有的行，只保留X的列，不匹配Y的列
df_X %>% semi_join(df_Y, by = "ID")

# 6.反连接 ------------------------------

# 在X中查找存在于Y的行，并删除，不匹配列
df_X %>% anti_join(df_Y, by = "ID")
