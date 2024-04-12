EXECUTE IMMEDIATE $$

MERGE INTO "UNIVERSITY_BLUETAB"."SOLUTION_TIER"."DIM_TIME_VICTOR" AS "Dim_Year" USING (
    SELECT DISTINCT "Release_Year" as "Year_Num" FROM "UNIVERSITY_BLUETAB"."DOMAIN_TIER"."STG_GAMES_ADD_VICTOR"
    ORDER BY 1
    ) AS "Stage" ON "Dim_Year"."Year_Num" = "Stage"."Year_Num"
WHEN MATCHED THEN UPDATE SET 
    "Dim_Year"."Year_Num" = "Stage"."Year_Num", 
    "Dim_Year"."CreatedBy" = CURRENT_USER(), 
    "Dim_Year"."CreatedOn" = CURRENT_DATE()
WHEN NOT MATCHED THEN 
    INSERT ("Year_Num", "CreatedBy", "CreatedOn") 
    VALUES ("Stage"."Year_Num", CURRENT_USER(), CURRENT_DATE()
    );

$$;