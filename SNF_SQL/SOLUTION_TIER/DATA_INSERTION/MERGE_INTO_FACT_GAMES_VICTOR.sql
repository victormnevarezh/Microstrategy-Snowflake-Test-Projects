EXECUTE IMMEDIATE $$

CREATE OR REPLACE TABLE "UNIVERSITY_BLUETAB"."SOLUTION_TIER"."FACT_GAMES_VICTOR" AS(
SELECT 
    "Id_Product",
    "Id_Platform",
    "Id_Year",
    "Id_Genre",
    "Id_Publisher",
    "Id_Region",
    "Sales",
    "Cost",
    ("Sales" - "Cost") as "Earnings"
FROM 
    "UNIVERSITY_BLUETAB"."DOMAIN_TIER"."STG_GAMES_ADD_VICTOR" AS STG
INNER JOIN 
    "UNIVERSITY_BLUETAB"."SOLUTION_TIER"."DIM_PRODUCT_VICTOR" AS DIM_Product
ON 
    STG."Name" = DIM_Product."Nm_Product"
    
INNER JOIN 
    "UNIVERSITY_BLUETAB"."SOLUTION_TIER"."DIM_PLATFORM_VICTOR" AS DIM_Platform
ON 
    STG."Platform" = DIM_Platform."Nm_Platform"

INNER JOIN 
    "UNIVERSITY_BLUETAB"."SOLUTION_TIER"."DIM_PUBLISHER_VICTOR" AS DIM_Publisher
ON 
    STG."Publisher" = DIM_Publisher."Nm_Publisher"

INNER JOIN 
    "UNIVERSITY_BLUETAB"."SOLUTION_TIER"."DIM_TIME_VICTOR" AS DIM_Time
ON 
    STG."Release_Year" = DIM_Time."Year_Num"

INNER JOIN 
    "UNIVERSITY_BLUETAB"."SOLUTION_TIER"."DIM_GENRE_VICTOR" AS DIM_Genre
ON 
    STG."Genre" = DIM_Genre."Nm_Genre"

INNER JOIN 
    "UNIVERSITY_BLUETAB"."SOLUTION_TIER"."DIM_REGION_VICTOR" AS DIM_Region
ON 
    STG."Region" = DIM_Region."Nm_Region"
);

$$;