@echo off

echo COPY_INTO_FF_GAMES_VICTOR
pause
echo TRUNCATE_FF_GAMES_VICTOR
snowsql -c bluetab -f C:\SNF_SQL\RAW_TIER\DATA_INSERTION\TRUNCATE_FF_GAMES_VICTOR.sql
echo COPY_INTO_FF_GAMES_VICTOR
snowsql -c bluetab -f C:\SNF_SQL\RAW_TIER\DATA_INSERTION\COPY_INTO_FF_GAMES_VICTOR.sql

pause