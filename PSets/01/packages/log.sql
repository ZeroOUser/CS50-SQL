
-- *** The Lost Letter ***

-- check data about the address '900 Somerville Avenue'
SELECT * FROM "addresses" WHERE "address" = '900 Somerville Avenue';

-- check data about the address '2 finegan street' and check the correct address
SELECT * FROM "addresses" WHERE "address" LIKE '2 fin%';

-- get contents about lost package
SELECT * FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '900 Somerville Avenue'
) AND "to_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" LIKE '2 fin%'
);

-- get data about lost package
SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '900 Somerville Avenue'
    ) AND "to_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" LIKE '2 fin%'
    )
);

-- last query
SELECT * FROM "addresses" WHERE "id" = (
    SELECT "address_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        ) AND "to_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" LIKE '2 fin%'
        )
    ) AND "action" = 'Drop'
);
-- *** The Devious Delivery ***

-- find package that has null "from" address
SELECT * FROM "packages" WHERE "from_address_id" IS NULL;

-- find where package dropped
SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages"
    WHERE "from_address_id" IS NULL
) AND "action" = 'Drop';

-- find the address name
SELECT * FROM "addresses" WHERE "id" = (
    SELECT "address_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" IS NULL
    ) AND "action" = 'Drop'
);

-- *** The Forgotten Gift ***

-- find id of the "from" address
SELECT * FROM "addresses" WHERE "address" = '109 Tileston Street';

-- find id of the "to" address
SELECT * FROM "addresses" WHERE "address" = '728 Maple Place';

-- find the package
SELECT * FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '109 Tileston Street'
) AND "to_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '728 Maple Place'
);

-- find where package dropped
SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '109 Tileston Street'
    ) AND "to_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '728 Maple Place'
    )
);

-- find who is driver
SELECT * FROM "drivers" WHERE "id" = (
    SELECT "driver_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '109 Tileston Street'
        ) AND "to_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '728 Maple Place'
        )
    ) ORDER BY "timestamp" DESC LIMIT 1
);