CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT,
    "price_per_unit" REAL,
    PRIMARY KEY("id")
);
CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT,
    "gluten_free" INTEGER,
    "price" REAL,
    PRIMARY KEY("id")
);
CREATE TABLE "contain" (
    "id" INTEGER,
    "ingredient_id" INTEGER,
    "donut_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);
CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    PRIMARY KEY("id")
);
CREATE TABLE "orders" (
    "id" INTEGER,
    "number" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);
CREATE TABLE "make" (
    "id" INTEGER,
    "order_id" INTEGER,
    "donut_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);
