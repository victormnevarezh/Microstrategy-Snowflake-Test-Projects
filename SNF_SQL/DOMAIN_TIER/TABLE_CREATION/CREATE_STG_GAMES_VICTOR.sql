EXECUTE IMMEDIATE $$

CREATE OR REPLACE TABLE "UNIVERSITY_BLUETAB"."DOMAIN_TIER"."STG_GAMES_VICTOR" (
    "Name" VARCHAR(300),
	"Platform" VARCHAR(300),
	"Year" VARCHAR(4),
	"Publisher" VARCHAR(300),
	"Genre" VARCHAR(300),
	"Region" VARCHAR(16777216),
	"Amount" NUMBER(20,4)
);

$$;