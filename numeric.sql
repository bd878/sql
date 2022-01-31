DROP TABLE IF EXISTS test_numeric;

CREATE TABLE test_numeric (
  measurement numeric,
  description text
);

INSERT INTO test_numeric VALUES (
  12345678.87654321, 'Width 16, precision 8'
);
INSERT INTO test_numeric VALUES (
  1.5, 'Width 2, precision 1'
);
INSERT INTO test_numeric VALUES (
  1234567890, 'Width 10, precision 0'
);