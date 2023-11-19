# Fri Sep 29 18:32:19 2023 ------------------------------
library(FrF2)

`浓度` = c("60%", "70%", "80%")
`用量` = c(10, 12.5, 15)
`时间` = c(15, 30, 45)


FrF2(8, 4, factor.names = list(
  temp = c("min", "max"),
  press = c("low", "normal"),
  material = c("current", "new"),
  state = c("new", "aged")
))
