DROP VIEW IF EXISTS moscow_airports;

CREATE VIEW moscow_airports AS
  SELECT airports.*
    FROM airports
    WHERE city = 'Moscow'
    ORDER BY airport_name;

INSERT INTO moscow_airports
  VALUES ('DME', 'Domodedovo', 'Moscow', 37.906, 55.408, 'Europe/Moscow');
