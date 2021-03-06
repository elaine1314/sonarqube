CREATE TABLE "METRICS" (
  "ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
  "NAME" VARCHAR(64) NOT NULL,
  "DESCRIPTION" VARCHAR(255),
  "DIRECTION" INTEGER NOT NULL DEFAULT 0,
  "DOMAIN" VARCHAR(64),
  "SHORT_NAME" VARCHAR(64),
  "QUALITATIVE" BOOLEAN NOT NULL DEFAULT FALSE,
  "VAL_TYPE" VARCHAR(8),
  "USER_MANAGED" BOOLEAN DEFAULT FALSE,
  "ENABLED" BOOLEAN DEFAULT TRUE,
  "WORST_VALUE" DOUBLE,
  "BEST_VALUE" DOUBLE,
  "OPTIMIZED_BEST_VALUE" BOOLEAN,
  "HIDDEN" BOOLEAN,
  "DELETE_HISTORICAL_DATA" BOOLEAN,
  "DECIMAL_SCALE" INTEGER
);
CREATE UNIQUE INDEX "METRICS_UNIQUE_NAME" ON "METRICS" ("NAME");

CREATE TABLE "QUALITY_GATES" (
  "ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
  "UUID" VARCHAR(40) NOT NULL,
  "NAME" VARCHAR(100) NOT NULL,
  "IS_BUILT_IN" BOOLEAN NOT NULL,
  "CREATED_AT" TIMESTAMP,
  "UPDATED_AT" TIMESTAMP,
);
CREATE UNIQUE INDEX "UNIQ_QUALITY_GATES_UUID" ON "QUALITY_GATES" ("UUID");

CREATE TABLE "QUALITY_GATE_CONDITIONS" (
  "ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
  "QGATE_ID" INTEGER,
  "METRIC_ID" INTEGER,
  "OPERATOR" VARCHAR(3),
  "VALUE_ERROR" VARCHAR(64),
  "VALUE_WARNING" VARCHAR(64),
  "PERIOD" INTEGER,
  "CREATED_AT" TIMESTAMP,
  "UPDATED_AT" TIMESTAMP,
);
