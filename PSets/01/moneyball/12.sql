SELECT "first_name", "last_name" FROM (
SELECT "first_name", "last_name", "id" FROM (
SELECT "players"."first_name", "players"."last_name", "players"."id"
FROM "players" JOIN "performances"
ON "players"."id" = "performances"."player_id"
JOIN "salaries"
ON "players"."id" = "salaries"."player_id" AND "salaries"."year" = "performances"."year"
WHERE "salaries"."year" = 2001 AND "performances"."H" > 0
ORDER BY "salaries"."salary" / "performances"."H"
LIMIT 10)

INTERSECT

SELECT "first_name", "last_name", "id" FROM (
SELECT "players"."first_name", "players"."last_name", "players"."id"
FROM "players" JOIN "performances"
ON "players"."id" = "performances"."player_id"
JOIN "salaries"
ON "players"."id" = "salaries"."player_id" AND "salaries"."year" = "performances"."year"
WHERE "salaries"."year" = 2001 AND "performances"."RBI" > 0
ORDER BY "salaries"."salary" / "performances"."RBI"
LIMIT 10)
) ORDER BY "id";