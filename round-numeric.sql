CREATE TABLE IF NOT EXISTS test_numeric (
  measurement numeric(5, 2),
  description text
);

INSERT INTO test_numeric VALUES (999.99999, 'Some space');
INSERT INTO test_numeric VALUES (11.1, 'Yet another space');
INSERT INTO test_numeric VALUES (9.9009, 'More space required');
