EXECUTE IMMEDIATE $$

MERGE INTO "UNIVERSITY_BLUETAB"."SOLUTION_TIER"."DIM_PUBLISHER_VICTOR" AS "Dim_Publisher" USING (
    SELECT DISTINCT "Publisher" as "Publisher" FROM "UNIVERSITY_BLUETAB"."DOMAIN_TIER"."STG_GAMES_ADD_VICTOR"
    ORDER BY 1
    ) AS "Stage" ON "Dim_Publisher"."Nm_Publisher" = "Stage"."Publisher"
WHEN MATCHED THEN UPDATE SET 
    "Dim_Publisher"."Nm_Publisher" = "Stage"."Publisher", 
    "Dim_Publisher"."CreatedBy" = CURRENT_USER(), 
    "Dim_Publisher"."CreatedOn" = CURRENT_DATE()
WHEN NOT MATCHED THEN 
    INSERT ("Nm_Publisher", "CreatedBy", "CreatedOn") 
    VALUES ("Stage"."Publisher", CURRENT_USER(), CURRENT_DATE()
    );

$$;