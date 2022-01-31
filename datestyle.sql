SHOW datestyle;
SET datestyle TO 'MDY';
SELECT '18-05-2016'::date;
SELECT '05-18-2016'::date;
SELECT '05-18-2016'::timestamp;
SET datestyle TO DEFAULT;

SELECT current_timestamp as ISO;
SET datestyle TO 'Postgres, DMY';
SELECT current_timestamp as postgres;

SET datestyle TO 'German, DMY';
SELECT current_timestamp as german;

SET datestyle TO 'SQL, DMY';
SELECT current_timestamp as sql;

SET datestyle TO DEFAULT;
