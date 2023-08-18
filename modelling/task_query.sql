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

UPDATE public_school_nsw_master_dataset
SET Phone = REPLACE(Phone, ' ', '');

UPDATE public_school_nsw_master_dataset 
SET Indigenous_pct = NULL 
WHERE Indigenous_pct = 'np';

ALTER TABLE public_school_nsw_master_dataset 
ALTER COLUMN Indigenous_pct SET DATA TYPE DOUBLE;

UPDATE public_school_nsw_master_dataset 
SET LBOTE_pct = NULL 
WHERE LBOTE_pct = 'np';

ALTER TABLE public_school_nsw_master_dataset 
ALTER COLUMN LBOTE_pct SET DATA TYPE DOUBLE;

UPDATE public_school_nsw_master_dataset
SET Date_1st_teacher = 
CASE 
    WHEN POSITION('/' IN Date_1st_teacher) > 0 THEN -- if the date contains a slash, it's in the DD/MM/YYYY format
        SUBSTR(Date_1st_teacher, 7, 4) || '-' || 
        SUBSTR(Date_1st_teacher, 4, 2) || '-' || 
        SUBSTR(Date_1st_teacher, 1, 2)
    ELSE 
        Date_1st_teacher 
END;

UPDATE public_school_nsw_master_dataset
SET Date_1st_teacher = CAST(Date_1st_teacher AS DATE);




