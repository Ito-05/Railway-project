appid <- "12604ebf628834b46b3867721893644141fe9a34"

fetch_children <- function(appid) {
  # 1995; "0000032240"
  # 2000; "0000032980"
  # 2005; "0000033816"
  # 2010; "0003038598"

  # 1995;
  df_raw <- estatapi::estat_getStatsData(
    appId = appid,
    statsDataId = "0000032240")
  write.csv(df_raw, here::here("01_data", "raw", "children", "1995.csv"), fileEncoding = "CP932", row.names = FALSE)

  # 2000;
  df_raw <- estatapi::estat_getStatsData(
    appId = appid,
    statsDataId = "0000032980")
  write.csv(df_raw, here::here("01_data", "raw", "children", "2000.csv"), fileEncoding = "CP932", row.names = FALSE)

  # 2005;
  df_raw <- estatapi::estat_getStatsData(
    appId = appid,
    statsDataId = "0000033816")
  write.csv(df_raw, here::here("01_data", "raw", "children", "2005.csv"), fileEncoding = "CP932", row.names = FALSE)

  # 2010;
  df_raw <- estatapi::estat_getStatsData(
    appId = appid,
    statsDataId = "0003038598")
  write.csv(df_raw, here::here("01_data", "raw", "children", "2010.csv"), fileEncoding = "CP932", row.names = FALSE)

}


fetch_housetype <- function(appid) {
  # 1995  ; "0000032264"
  # 2000_a; "0000032999" over  30 mill
  # 2000_b; "0000033001" under 30 mill
  # 2005  ; "0000033837"
  # 2010  ; "0003038618"
  
  # 1995;
    df_raw <- estatapi::estat_getStatsData(
      appId = appid,
      statsDataId = "0000032264")
    
    write.csv(df_raw, here::here("01_data", "raw", "housetype", "1995.csv"), fileEncoding = "CP932", row.names = FALSE)
  # 2000_a;
    df_raw <- estatapi::estat_getStatsData(
      appId = appid,
      statsDataId = "0000032999")
    write.csv(df_raw, here::here("01_data", "raw", "housetype", "2000_a.csv"), fileEncoding = "CP932", row.names = FALSE)
  # 2000_b;
    df_raw <- estatapi::estat_getStatsData(
      appId = appid,
      statsDataId = "0000033001")
    write.csv(df_raw, here::here("01_data", "raw", "housetype", "2000_b.csv"), fileEncoding = "CP932", row.names = FALSE)
  # 2005;
    df_raw <- estatapi::estat_getStatsData(
      appId = appid,
      statsDataId = "0000033837")
    write.csv(df_raw, here::here("01_data", "raw", "housetype", "2005.csv"), fileEncoding = "CP932", row.names = FALSE)
  # 2010;
    df_raw <- estatapi::estat_getStatsData(
      appId = appid,
      statsDataId = "0003038618")
    write.csv(df_raw, here::here("01_data", "raw", "housetype", "2010.csv"), fileEncoding = "CP932", row.names = FALSE)

}


fetch_residence_year <- function(appid) {

    # 2000; 0000033277
    # 2010; 0003067226


  # 2000;
    df_raw <- estatapi::estat_getStatsData(
      appId = appid,
      statsDataId = "0000033277")
    write.csv(df_raw, here::here("01_data", "raw", "residence_year", "2000.csv"), fileEncoding = "CP932", row.names = FALSE)
  # 2010;
    df_raw <- estatapi::estat_getStatsData(
      appId = appid,
      statsDataId = "0003067226")
    write.csv(df_raw, here::here("01_data", "raw", "residence_year", "2010.csv"), fileEncoding = "CP932", row.names = FALSE)    

}


fetch_working <- function(appid) {
    # 1995_a; 0000032370
    # 1995_a; FEH_00200521_240616150337.csv
    # 1995_b; 0000032372
    # 1995_b; FEH_00200521_240616151544.csv
    # 2000;   0000033143
    # 2000;   FEH_00200521_240616151140.csv
    # 2005;   0000033948
    # 2005;   FEH_00200521_240616151348.csv
    # 2010;   0003052121
    # 2010;   FEH_00200521_240616151753.csv

    # data is very large, so we ristrict raw data when fetching 

    # １５歳以上年齢各歳 : 総数
    # 労働力状態 : 就業者数
    # 全域・集中の別030184 : 全域
    # 男女 : 総数
    # 配偶関係５031126 : 総数（不詳含む）

    # ダウンロード設定：
    # ヘッダの出力 : しない
    # コードの出力 : しない

    # 1995
    # df_raw <- estatapi::estat_getStatsData(
    #   appId = appid,
    #   statsDataId = "0000032370")
    # write.csv(df_raw, here::here("01_data", "raw", "worker", "1995_a.csv"), fileEncoding = "CP932", row.names = FALSE)    
    # 1995
    # df_raw <- estatapi::estat_getStatsData(
    #   appId = appid,
    #   statsDataId = "0000032372")
    # write.csv(df_raw, here::here("01_data", "raw", "worker", "1995_b.csv"), fileEncoding = "CP932", row.names = FALSE)    
    
    # 2000; statsDataId = "0000033134"
    # save a different way because of the large size
    # access https://www.e-stat.go.jp/stat-search/database?page=1&layout=datalist&toukei=00200521&tstat=000000030001&cycle=0&tclass1=000000030147&tclass2=000000030151&statdisp_id=0000033134&tclass3val=0
    # click DB to reduce data
    # 
    # 配偶関係５031126 : 総数（不詳含む）
    # 全域・集中の別030184 : 全域
    # 男女 : 総数
    # 労働力状態031129 : 総数、労働力人口、就業者、非労働力人口

    # 2005
    # df_raw <- estatapi::estat_getStatsData(
    #   appId = appid,
    #   statsDataId = "0000033948")
    # write.csv(df_raw, here::here("01_data", "raw", "worker", "2005.csv"), fileEncoding = "CP932", row.names = FALSE)    
    # 2010
    # df_raw <- estatapi::estat_getStatsData(
    #   appId = appid,
    #   statsDataId = "0003052121")
    # write.csv(df_raw, here::here("01_data", "raw", "worker", "2010.csv"), fileEncoding = "CP932", row.names = FALSE)    



}



fetch_student <- function(appid) {
    # 1995; 
    # 2000; 
    # 2005; 
    # 2010; 
    
}

# fetch_children(appid)
# fetch_housetype(appid)
# fetch_residence_year(appid)
fetch_working(appid)

pacman::p_load(
  readr,
  dplyr,
  stringr,
)