appid <- "12604ebf628834b46b3867721893644141fe9a34"

fetch_worker <- function(appid) {
    # 事業所・企業統計調査
    # 1991; 0000040713
    # 1994; 0000040882
    # 1996; 0000040986
    # 1999; 0000041273
    # 2001; 0000041449
    # 2004; 0000041658
    # 2006; 0003000602
    
    # 経済センサス - 基礎調査
    # 2009; 0003032532
    # 2014; 0003117639

    # 経済センサス - 活動調査
    # 2012; 0003085552

    df_raw <- estatapi::estat_getStatsData(
        appId = appid,
        statsDataId = "")
    write.csv(df_raw, here::here("01_data", "raw", "worker", "1991.csv"), fileEncoding = "CP932", row.names = FALSE)

    df_raw <- estatapi::estat_getStatsData(
        appId = appid,
        statsDataId = "")
    write.csv(df_raw, here::here("01_data", "raw", "worker", "1994.csv"), fileEncoding = "CP932", row.names = FALSE)

    df_raw <- estatapi::estat_getStatsData(
        appId = appid,
        statsDataId = "")
    write.csv(df_raw, here::here("01_data", "raw", "worker", "1996.csv"), fileEncoding = "CP932", row.names = FALSE)

    df_raw <- estatapi::estat_getStatsData(
        appId = appid,
        statsDataId = "")
    write.csv(df_raw, here::here("01_data", "raw", "worker", "1999.csv"), fileEncoding = "CP932", row.names = FALSE)







}