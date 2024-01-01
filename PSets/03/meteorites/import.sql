CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT CHECK("discovery" IN ('Fell', 'Found')),
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY("id") 
);
.import --csv meteorites.csv temp
INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM "temp" WHERE
"nametype" != 'Relict' ORDER BY "year", "name";
DROP TABLE "temp";
UPDATE "meteorites" SET "mass" = NULL WHERE "mass" = '';
UPDATE "meteorites" SET "lat" = NULL WHERE "lat" = '';
UPDATE "meteorites" SET "long" = NULL WHERE "long" = '';
UPDATE "meteorites" SET "year" = NULL WHERE "year" = '';
UPDATE "meteorites" SET "mass" = ROUND("mass", 2);
UPDATE "meteorites" SET "lat" = ROUND("lat", 2);
UPDATE "meteorites" SET "long" = ROUND("long", 2);