# Fri Sep 29 23:26:28 2023 ------------------------------
library(rio)
library(purrr)
library(rstatix)
library(ggplot2)

df = import("dataset/8-1.儿童体重与体表面积关系.csv")
df

# 正态性检验
df %>%
  select(体重, 体表面积) %>%
  map_dfr(shapiro_test, .id = "数据")

# 相关性检验
df %>%
  cor_test(体重, 体表面积)

# 线性回归
df %>%
  lm(体表面积 ~ 体重, data = .) %>%
  summary()
  # report::report()
  # tidy()

# 拟合图
ggplot(df, aes(x = 体表面积, y = 体重)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x, se = TRUE) +
  labs(
    x = "Weight (kg)",
    y = "Body surface area (0.1m^2)"
  )
