EXECUTE IMMEDIATE $$

MERGE INTO "UNIVERSITY_BLUETAB"."SOLUTION_TIER"."DIM_GENRE_VICTOR" AS "Dim_Genre" USING (
    SELECT DISTINCT "Genre" as "Genre" FROM "UNIVERSITY_BLUETAB"."DOMAIN_TIER"."STG_GAMES_ADD_VICTOR"
    ORDER BY 1
    ) AS "Stage" ON "Dim_Genre"."Nm_Genre" = "Stage"."Genre"
WHEN MATCHED THEN UPDATE SET 
    "Dim_Genre"."Nm_Genre" = "Stage"."Genre", 
    "Dim_Genre"."CreatedBy" = CURRENT_USER(), 
    "Dim_Genre"."CreatedOn" = CURRENT_DATE()
WHEN NOT MATCHED THEN 
    INSERT ("Nm_Genre", "CreatedBy", "CreatedOn") 
    VALUES ("Stage"."Genre", CURRENT_USER(), CURRENT_DATE()
    );

$$;