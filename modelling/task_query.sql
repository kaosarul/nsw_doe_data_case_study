CREATE TABLE multi_age_composite_dataset AS SELECT * FROM read_csv_auto('./data/multi_age_composite_classes.csv');

CREATE TABLE student_attendance_data AS SELECT * FROM read_csv_auto('./data/attendance_data.csv');

SELECT * from multi_age_composite_dataset;
SELECT * from multi_age_composite_dataset