CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT,
    "password" TEXT,
    PRIMARY KEY("id")
);
CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT,
    "type" TEXT,
    "location" TEXT,
    "year" INTEGER,
    PRIMARY KEY("id")
);
CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")
);
CREATE TABLE "follow" (
    "id" INTEGER,
    "user_id" INTEGER,
    "user2_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY ("user_id", "user2_id") REFERENCES "users"("id", "id")
);
CREATE TABLE "study" (
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" DATETIME,
    "end_date" DATETIME,
    "degree" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);
CREATE TABLE "working" (
    "id" INTEGER,
    "title" TEXT,
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" DATETIME,
    "end_date" DATETIME,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
)