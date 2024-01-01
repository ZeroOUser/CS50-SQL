SELECT "players"."first_name", "players"."last_name", "salaries"."salary", "performances"."HR", "salaries"."year"
FROM "players" JOIN "performances"
ON "players"."id" = "performances"."player_id"
JOIN "salaries"
ON "players"."id" = "salaries"."player_id" AND "salaries"."year" = "performances"."year"
ORDER BY "players"."id", "salaries"."year" DESC, "performances"."HR" DESC, "salaries"."salary" DESC;