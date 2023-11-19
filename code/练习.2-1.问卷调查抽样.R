# Tue Sep 19 19:23:50 2023 ------------------------------

df = tibble(
  ID = 1:60,
  gender = rep(c("男", "女"), c(39, 21))
)
df

# 1.单纯随机抽样 ------------------------------

set.seed(123)
df %>%
  sample_n(20) %>%
  arrange(ID)

# 2.系统抽样 ------------------------------

df[seq(2, nrow(df), nrow(df) / 20), ]

# 3.分层抽样  ------------------------------

set.seed(123)
df %>%
  group_by(gender) %>%
  sample_frac(20 / 60) %>%
  arrange(ID)
