CREATE TABLE "cipher" (
    "sentence_number" INTEGER,
    "character_number" INTEGER,
    "message_length" INTEGER,
    FOREIGN KEY("sentence_number") REFERENCES "sentences"("id")
);
INSERT INTO "cipher" VALUES (14, 98, 4), (114, 3, 5), (618, 72, 9), (630, 7, 3), (932, 12, 5), (2230, 50, 7),
(2346, 44, 10), (3041, 14, 5);
CREATE VIEW "message" AS
SELECT substr("sentences"."sentence", "cipher"."character_number", "cipher"."message_length") AS "phrase"
FROM "sentences" JOIN "cipher" ON "sentences"."id" = "cipher"."sentence_number";