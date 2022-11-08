CREATE TABLE "Reader" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "surname" varchar,
  "address" varchar,
  "birthday" date
);

CREATE TABLE "Book" (
  "isbn" integer PRIMARY KEY,
  "year" integer,
  "title" varchar,
  "author" varchar,
  "num_pages" integer,
  "publishing_house_id" integer
);

CREATE TABLE "BookInstance" (
  "instance_number" integer,
  "isbn" integer,
  "position" integer,
  PRIMARY KEY ("instance_number", "isbn")
);

CREATE TABLE "PublishingHouse" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "address" varchar
);

CREATE TABLE "Category" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "parent_id" integer
);

CREATE TABLE "Posession" (
  "expiration" timestamp,
  "book_isbn" integer,
  "instance_number" integer,
  "reader_id" integer
);

ALTER TABLE "BookInstance" ADD FOREIGN KEY ("isbn") REFERENCES "Book" ("isbn");

ALTER TABLE "Book" ADD FOREIGN KEY ("publishing_house_id") REFERENCES "PublishingHouse" ("id");

ALTER TABLE "Category" ADD FOREIGN KEY ("parent_id") REFERENCES "Category" ("id");

CREATE TABLE "Category_Book" (
  "Category_id" integer,
  "Book_isbn" integer,
  PRIMARY KEY ("Category_id", "Book_isbn")
);

ALTER TABLE "Category_Book" ADD FOREIGN KEY ("Category_id") REFERENCES "Category" ("id");

ALTER TABLE "Category_Book" ADD FOREIGN KEY ("Book_isbn") REFERENCES "Book" ("isbn");


ALTER TABLE "Posession" ADD FOREIGN KEY ("reader_id") REFERENCES "Reader" ("id");

ALTER TABLE "Posession" ADD FOREIGN KEY ("book_isbn", "instance_number") REFERENCES "BookInstance" ("isbn", "instance_number");
