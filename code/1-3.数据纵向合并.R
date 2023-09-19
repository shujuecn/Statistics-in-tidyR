# Tue Sep 19 10:47:15 2023 ------------------------------
library(purrr)
library(readxl)

# 1.读取多个文件后合并 --------------------

files = fs::dir_ls("./dataset/1-3.数据文件合并/", glob = "*.csv")
map_dfr(files, readr::read_csv)

# 2.读取单个文件的多个sheet后合并 --------------------

path = "./dataset/1-3.数据文件合并/abc-身高.xlsx"
map_dfr(
  set_names(excel_sheets(path)),
  ~ read_xlsx(path, sheet = .x),
  .id = "sheet" # 指定数据来源sheet名称
)

# 3.合并已加载的数据 --------------------

df_a = rio::import("./dataset/1-3.数据文件合并/a-身高.csv")
df_b = rio::import("./dataset/1-3.数据文件合并/b-身高.csv")
df_c = rio::import("./dataset/1-3.数据文件合并/c-身高.csv")
dplyr::bind_rows(df_a, df_b, df_c)
