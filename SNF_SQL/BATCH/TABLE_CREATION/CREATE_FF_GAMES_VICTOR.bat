@echo off

echo INSERT DATA INTO TABLES
pause
echo MERGE_INTO_STG_GAMES_VICTOR
snowsql -c bluetab -f C:\SNF_SQL\RAW_TIER\TABLE_CREATION\CREATE_FF_GAMES_VICTOR.sql

pause