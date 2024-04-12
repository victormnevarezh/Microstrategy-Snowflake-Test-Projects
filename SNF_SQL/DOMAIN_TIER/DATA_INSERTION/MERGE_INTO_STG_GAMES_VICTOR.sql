EXECUTE IMMEDIATE $$ 

MERGE INTO "UNIVERSITY_BLUETAB"."DOMAIN_TIER"."STG_GAMES_VICTOR" AS "Target"
USING (
    SELECT 
        RTRIM(LTRIM(UPPER(IFNULL("Name", 'UNKNOWN')))) AS "Name",
        RTRIM(LTRIM(UPPER(IFNULL("Platform", 'UNKNOWN')))) AS "Platform",
        "Year" AS "Year",
        RTRIM(LTRIM(UPPER(IFNULL("Publisher", 'UNKNOWN')))) AS "Publisher",
        RTRIM(LTRIM(UPPER(IFNULL("Genre", 'UNKNOWN')))) AS "Genre",
        "Region",
        CAST("Amount" AS DECIMAL(20,4)) AS "Amount"
    FROM "UNIVERSITY_BLUETAB"."RAW_TIER"."FF_GAMES_VICTOR"
        UNPIVOT("Amount" FOR "Region" IN (
            "CN_Sales",
            "EU_Sales",
            "JP_Sales",
            "LATAM_Sales",
            "CN_Cost",
            "EU_Cost",
            "JP_Cost",
            "LATAM_Cost"
        ))
) AS "Source"
ON (
    "Target"."Name" = "Source"."Name" AND
    "Target"."Platform" = "Source"."Platform" AND
    "Target"."Year" = "Source"."Year" AND
    "Target"."Publisher" = "Source"."Publisher" AND
    "Target"."Genre" = "Source"."Genre" AND
    "Target"."Region" = "Source"."Region"
)
WHEN NOT MATCHED THEN
    INSERT (
        "Name", "Platform", "Year", "Publisher", "Genre", "Region", "Amount"
    )
    VALUES (
        "Source"."Name", "Source"."Platform", "Source"."Year",
        "Source"."Publisher", "Source"."Genre", "Source"."Region", "Source"."Amount"
    );

$$;