CREATE TABLE multi_age_composite_dataset AS SELECT * FROM read_csv_auto('./data/multi_age_composite_classes.csv');

CREATE TABLE student_attendance_data AS SELECT * FROM read_csv_auto('./data/attendance_data.csv');

SELECT * from multi_age_composite_unpivoted;
SELECT * from public_school_nsw_master_dataset;

ALTER TABLE student_attendance_data RENAME TO student_attendance_dataset;

ALTER TABLE multi_age_composite_unpivoted 
RENAME COLUMN value TO Composite_Value;

ALTER TABLE multi_age_composite_unpivoted 
ALTER COLUMN School_Code SET DATA TYPE BIGINT;

ALTER TABLE multi_age_composite_unpivoted 
ALTER COLUMN Year SET DATA TYPE INT;

UPDATE multi_age_composite_unpivoted
SET Composite_Value = NULL
WHERE Composite_Value = 'NULL';

ALTER TABLE multi_age_composite_unpivoted
ALTER COLUMN Composite_Value SET DATA TYPE FLOAT;


