EXECUTE IMMEDIATE $$

MERGE INTO "UNIVERSITY_BLUETAB"."SOLUTION_TIER"."DIM_PRODUCT_VICTOR" AS "Product" USING (
    SELECT DISTINCT "Name" as "Name" FROM "UNIVERSITY_BLUETAB"."DOMAIN_TIER"."STG_GAMES_ADD_VICTOR"
    ORDER BY 1
    ) AS "Stage" ON "Product"."Nm_Product" = "Stage"."Name"
    WHEN MATCHED THEN UPDATE SET 
    "Product"."Nm_Product" = "Stage"."Name", 
    "Product"."CreatedBy" = CURRENT_USER(), 
    "Product"."CreatedOn" = CURRENT_DATE()
    WHEN NOT MATCHED THEN 
    INSERT ("Nm_Product", "CreatedBy", "CreatedOn") 
    VALUES ("Stage"."Name", CURRENT_USER(), CURRENT_DATE()
    );

$$;