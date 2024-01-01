CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER,
    PRIMARY KEY("id")
);
CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT,
    PRIMARY KEY("id")
);
CREATE TABLE "operation" (
    "id" INTEGER,
    "airline_id" INTEGER,
    "concourse" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);
CREATE TABLE "flights" (
    "id" INTEGER,
    "number" INTEGER,
    "airline_id" INTEGER,
    "from_airport_code" TEXT,
    "to_airport_code" TEXT,
    "departure_datetime" DATETIME,
    "arrival_datetime" DATETIME,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);
CREATE TABLE "check_ins" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "datetime" DATETIME,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);