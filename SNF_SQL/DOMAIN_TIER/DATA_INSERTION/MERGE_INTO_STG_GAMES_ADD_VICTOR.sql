EXECUTE IMMEDIATE $$ 

MERGE INTO "UNIVERSITY_BLUETAB"."DOMAIN_TIER"."STG_GAMES_ADD_VICTOR" AS "Target"
USING (
    SELECT
        "Name",
        "Platform",
        "Year" AS "Release_Year",
        "Publisher",
        "Genre",
        CASE WHEN "Region" = 'CN_Sales' OR "Region" = 'CN_Cost' THEN 'CN'
             WHEN "Region" = 'EU_Sales' OR "Region" = 'EU_Cost' THEN 'EU'
             WHEN "Region" = 'JP_Sales' OR "Region" = 'JP_Cost' THEN 'JP'
             WHEN "Region" = 'LATAM_Sales' OR "Region" = 'LATAM_Cost' THEN 'LATAM'
        END AS "Region",
        SUM(CASE WHEN "Region" IN ('CN_Sales', 'EU_Sales', 'JP_Sales', 'LATAM_Sales') THEN "Amount" ELSE 0 END) AS "Sales",
        SUM(CASE WHEN "Region" IN ('CN_Cost', 'EU_Cost', 'JP_Cost', 'LATAM_Cost') THEN "Amount" ELSE 0 END) AS "Cost"
    FROM "UNIVERSITY_BLUETAB"."DOMAIN_TIER"."STG_GAMES_VICTOR"
    GROUP BY "Name", "Platform", "Release_Year", "Genre", "Publisher", "Region"
) AS "Source"
ON (
    "Target"."Name" = "Source"."Name" AND
    "Target"."Platform" = "Source"."Platform" AND
    "Target"."Release_Year" = "Source"."Release_Year" AND
    "Target"."Genre" = "Source"."Genre" AND
    "Target"."Publisher" = "Source"."Publisher" AND
    "Target"."Region" = "Source"."Region"
)
WHEN NOT MATCHED THEN
    INSERT (
        "Name", "Platform", "Release_Year", "Publisher", "Genre", "Region", "Sales", "Cost"
    )
    VALUES (
        "Source"."Name", "Source"."Platform", "Source"."Release_Year",
        "Source"."Publisher", "Source"."Genre", "Source"."Region", "Source"."Sales", "Source"."Cost"
    );

$$;