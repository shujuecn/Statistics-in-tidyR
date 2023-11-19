# Fri Sep 29 22:13:09 2023 ------------------------------
library(rio)
library(rstatix)

df = import("dataset/3-1.两药镇痛效果析因设计.csv")
df

# 正态性检验
df %>%
  group_by(A药剂量) %>%
  shapiro_test(镇痛时间)
df %>%
  group_by(B药剂量) %>%
  shapiro_test(镇痛时间)

# 方差分析
df %>%
  anova_test(镇痛时间 ~ A药剂量 * B药剂量)
