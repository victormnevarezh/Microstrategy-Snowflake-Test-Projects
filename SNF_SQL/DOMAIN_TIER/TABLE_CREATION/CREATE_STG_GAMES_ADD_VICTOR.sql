EXECUTE IMMEDIATE $$

CREATE OR REPLACE TABLE "UNIVERSITY_BLUETAB"."DOMAIN_TIER"."STG_GAMES_ADD_VICTOR" (
	"Name" VARCHAR(300),
	"Platform" VARCHAR(300),
	"Release_Year" VARCHAR(4),
	"Publisher" VARCHAR(300),
	"Genre" VARCHAR(300),
	"Region" VARCHAR(16777216),
	"Sales" NUMBER(32,4),
	"Cost" NUMBER(32,4)
);

$$;