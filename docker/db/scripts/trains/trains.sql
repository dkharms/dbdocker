CREATE TABLE "Train" (
  "TrainNr" integer PRIMARY KEY,
  "Length" integer,
  "Start" varchar,
  "End" varchar
);

CREATE TABLE "City" (
  "Name" varchar,
  "Region" varchar,
  PRIMARY KEY ("Name", "Region")
);

CREATE TABLE "Station" (
  "Name" varchar PRIMARY KEY,
  "TracksNr" integer
);

CREATE TABLE "StationConnection" (
  "In" varchar,
  "Out" varchar
);

CREATE TABLE "StationSchedule" (
  "StationName" varchar,
  "TrainNr" integer,
  "Arrival" timestamp,
  "Departure" timestamp
);

ALTER TABLE "StationConnection" ADD FOREIGN KEY ("In") REFERENCES "Station" ("Name");

ALTER TABLE "StationConnection" ADD FOREIGN KEY ("Out") REFERENCES "Station" ("Name");

ALTER TABLE "Train" ADD FOREIGN KEY ("Start") REFERENCES "Station" ("Name");

ALTER TABLE "Train" ADD FOREIGN KEY ("End") REFERENCES "Station" ("Name");

ALTER TABLE "StationSchedule" ADD FOREIGN KEY ("StationName") REFERENCES "Station" ("Name");

ALTER TABLE "StationSchedule" ADD FOREIGN KEY ("TrainNr") REFERENCES "Train" ("TrainNr");
