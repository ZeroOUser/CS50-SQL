SELECT "city", COUNT("name") FROM "schools"
WHERE "type" LIKE '%public%'
GROUP BY "city"
ORDER BY COUNT("name") DESC, "city" LIMIT 10;
