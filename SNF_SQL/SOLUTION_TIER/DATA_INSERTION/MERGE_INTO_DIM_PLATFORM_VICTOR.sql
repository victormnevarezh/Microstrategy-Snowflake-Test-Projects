EXECUTE IMMEDIATE $$

MERGE INTO "UNIVERSITY_BLUETAB"."SOLUTION_TIER"."DIM_PLATFORM_VICTOR" AS "Dim_Platform" USING (
    SELECT DISTINCT "Platform" as "Platform" FROM "UNIVERSITY_BLUETAB"."DOMAIN_TIER"."STG_GAMES_ADD_VICTOR"
    ORDER BY 1
    ) AS "Stage" ON "Dim_Platform"."Nm_Platform" = "Stage"."Platform"
WHEN MATCHED THEN UPDATE SET 
    "Dim_Platform"."Nm_Platform" = "Stage"."Platform", 
    "Dim_Platform"."CreatedBy" = CURRENT_USER(), 
    "Dim_Platform"."CreatedOn" = CURRENT_DATE()
WHEN NOT MATCHED THEN 
    INSERT ("Nm_Platform", "CreatedBy", "CreatedOn") 
    VALUES ("Stage"."Platform", CURRENT_USER(), CURRENT_DATE()
    );

$$;