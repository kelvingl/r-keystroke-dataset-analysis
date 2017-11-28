library(RSQLite);

con <- dbConnect(RSQLite::SQLite(), "dataset.db");

tables <- dbListTables(con);

queryResult <- dbSendQuery(con, "
  SELECT 
    * 
  FROM 
    keystroke_typing kt 
  INNER JOIN keystroke_datas kd 
    ON kd.id = kt.keystroke_datas_id 
  INNER JOIN users u 
    ON u.id = kt.user_id;
");

dbClearResult(queryResult);

result <- dbFetch(queryResult);
