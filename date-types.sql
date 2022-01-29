SELECT (current_timestamp - timestamp '2019-05-12')::interval;

SELECT (date_trunc('hour', current_timestamp));

SELECT extract('min' FROM timestamp '1999-11-27 12:34:56');

SELECT '2 years 5 months ago'::interval;

SELECT timestamp with time zone '2016-05-30';

SELECT to_char(current_date, 'mm-dd-yyyy');
