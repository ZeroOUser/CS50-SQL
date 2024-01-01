SELECT "city", COUNT("name") FROM "schools"
WHERE "type" LIKE '%public%'
GROUP BY "city"
HAVING COUNT("name") < 4
ORDER BY COUNT("name") DESC, "city";
