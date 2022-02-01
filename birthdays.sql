DROP TABLE birthdays;

CREATE TABLE birthdays
( person text NOT NULL,
  birthday date NOT NULL
);

INSERT INTO birthdays VALUES ('Rob Pike', '1955-03-21');
INSERT INTO birthdays VALUES ('Amanda May', '2003-02-22');
INSERT INTO birthdays VALUES ('Andy Moore', '1987-03-12');

SELECT * FROM birthdays
  WHERE extract('mon' from birthday) = 3;

SELECT *, birthday + '40 years'::interval
  FROM birthdays
  WHERE birthday + '40 years'::interval < current_date;

SELECT *, age(current_date::timestamp, birthday::timestamp)
  FROM birthdays;
