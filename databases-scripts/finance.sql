CREATE TABLE IF NOT EXISTS tmp
(
  date     TEXT NOT NULL,
  open     FLOAT,
  high     FLOAT,
  low      FLOAT,
  close    FLOAT,
  adjclose FLOAT,
  volume   FLOAT
);

CREATE TABLE IF NOT EXISTS apple
(
  id       INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  company  TEXT DEFAULT apple NOT NULL,
  date     TEXT NOT NULL,
  open     FLOAT,
  high     FLOAT,
  low      FLOAT,
  close    FLOAT,
  adjclose FLOAT,
  volume   FLOAT,
  UNIQUE (id, company)
);

CREATE TABLE IF NOT EXISTS csco
(
  id       INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  company  TEXT DEFAULT csco NOT NULL,
  date     TEXT NOT NULL,
  open     FLOAT,
  high     FLOAT,
  low      FLOAT,
  close    FLOAT,
  adjclose FLOAT,
  volume   FLOAT,
  UNIQUE (id, company)
);

CREATE TABLE IF NOT EXISTS ms
(
  id       INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  company  TEXT DEFAULT ms NOT NULL,
  date     TEXT NOT NULL,
  open     FLOAT,
  high     FLOAT,
  low      FLOAT,
  close    FLOAT,
  adjclose FLOAT,
  volume   FLOAT,
  UNIQUE (id, company)
);

.mode csv

.import FakeData/AAPL.csv tmp

INSERT INTO apple (date, open, high, low, close, adjclose, volume,company) SELECT *, 'apple' FROM
  tmp WHERE NOT date='Date';

UPDATE apple SET date = date || ' 11:09:00.123';

DELETE FROM tmp;

.import FakeData/CSCO.csv tmp

INSERT INTO csco (date, open, high, low, close, adjclose, volume,company) SELECT *, 'csco' FROM
  tmp WHERE NOT date='Date';

UPDATE csco SET date = date || ' 11:09:00.123';

DELETE FROM tmp;

.import FakeData/MSFT.csv tmp

INSERT INTO ms (date, open, high, low, close, adjclose, volume,company) SELECT *, 'ms' FROM
  tmp WHERE NOT date='Date';

UPDATE ms SET date = date || ' 11:09:00.123';