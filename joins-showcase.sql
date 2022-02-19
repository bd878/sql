CREATE TABLE IF NOT EXISTS t1 (
  num integer NOT NULL,
  name char(3) NOT NULL,
  UNIQUE (num)
);

CREATE TABLE IF NOT EXISTS t2 (
  num integer NOT NULL,
  value char(3) NOT NULL,
  UNIQUE (num)
);

INSERT INTO t1 VALUES
  (1, 'a'),
  (2, 'b'),
  (3, 'c');

INSERT INTO t2 VALUES
  (1, 'xxx'),
  (2, 'yyy'),
  (5, 'zzz');

SELECT * FROM t1 INNER JOIN t2 ON t1.num = t2.num;

SELECT * FROM t1 CROSS JOIN t2;

SELECT * FROM t1 LEFT JOIN t2 ON t1.num = t2.num;

SELECT * FROM t1 RIGHT JOIN t2 ON t1.num = t2.num;

SELECT * FROM t1 FULL JOIN t2 ON t1.num = t2.num;
