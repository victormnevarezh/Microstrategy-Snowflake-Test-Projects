@echo off

echo Calling Batch Files for Table Creation
pause

call C:\SNF_SQL\BATCH\TABLE_CREATION\CREATE_FF_GAMES_VICTOR.bat
call C:\SNF_SQL\BATCH\TABLE_CREATION\CREATE_STG_GAMES_VICTOR.bat
call C:\SNF_SQL\BATCH\TABLE_CREATION\CREATE_STG_GAMES_ADD_VICTOR.bat
call C:\SNF_SQL\BATCH\TABLE_CREATION\CREATE_DIM_GENRE_VICTOR.bat
call C:\SNF_SQL\BATCH\TABLE_CREATION\CREATE_DIM_PLATFORM_VICTOR.bat
call C:\SNF_SQL\BATCH\TABLE_CREATION\CREATE_DIM_PRODUCT_VICTOR.bat
call C:\SNF_SQL\BATCH\TABLE_CREATION\CREATE_DIM_PUBLISHER_VICTOR.bat
call C:\SNF_SQL\BATCH\TABLE_CREATION\CREATE_DIM_REGION_VICTOR.bat
call C:\SNF_SQL\BATCH\TABLE_CREATION\CREATE_DIM_TIME_VICTOR.bat
call C:\SNF_SQL\BATCH\TABLE_CREATION\CREATE_FACT_GAMES_VICTOR.bat

echo All batch files executed successfully
pause