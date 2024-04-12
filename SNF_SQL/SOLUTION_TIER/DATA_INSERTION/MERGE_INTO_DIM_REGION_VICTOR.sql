EXECUTE IMMEDIATE $$

MERGE INTO "UNIVERSITY_BLUETAB"."SOLUTION_TIER"."DIM_REGION_VICTOR" AS "Dim_Region" USING (
    SELECT DISTINCT "Region" as "Region" FROM "UNIVERSITY_BLUETAB"."DOMAIN_TIER"."STG_GAMES_ADD_VICTOR"
    ORDER BY 1
    ) AS "Stage" ON "Dim_Region"."Nm_Region" = "Stage"."Region"
WHEN MATCHED THEN UPDATE SET 
    "Dim_Region"."Nm_Region" = "Stage"."Region", 
    "Dim_Region"."CreatedBy" = CURRENT_USER(), 
    "Dim_Region"."CreatedOn" = CURRENT_DATE()
WHEN NOT MATCHED THEN 
    INSERT ("Nm_Region", "CreatedBy", "CreatedOn") 
    VALUES ("Stage"."Region", CURRENT_USER(), CURRENT_DATE()
    );

$$;