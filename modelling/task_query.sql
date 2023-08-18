We would like you to develop a PhD research proposal for the title: 

"Deep Transformation of Tabular Categorical Data for Enhanced Predictive Analytics in Health Informatics". 

Please find a tentative summary of the project as given below:

This PhD project will delve into the realm of intelligent tabular data transformation with a focus on categorical data, aiming to enhance the accuracy of predictive analytics within the domain of health informatics. By developing advanced deep learning-based techniques for handling categorical data, the research will address a critical challenge in data preprocessing that significantly influences the quality of predictive models in healthcare. The study seeks to create novel methodologies that automate the transformation process, ensuring the efficient conversion of categorical variables into suitable formats for predictive analysis. Through rigorous experimentation and validation, this research promises to contribute substantially to the improvement of predictive analytics in health informatics, ultimately fostering more precise and reliable decision-making in the medical field.

Please find a sample research proposal attached to this email. Part-time PhD may take 3-6 years. You can pick/propose your timeline accordingly.

I am also attaching two research papers to start the literature review for you.

Tuition fee will be waived under RTP, and we will seek the approval of it for you. We will also seek for industry collaboration for your PhD project.














CREATE TABLE MULTI_AGE_COMPOSITE_DATASET AS SELECT * FROM READ_CSV_AUTO('./DATA/MULTI_AGE_COMPOSITE_CLASSES.CSV');

CREATE TABLE STUDENT_ATTENDANCE_DATA AS SELECT * FROM READ_CSV_AUTO('./DATA/ATTENDANCE_DATA.CSV');

SELECT * FROM MULTI_AGE_COMPOSITE_UNPIVOTED;
SELECT * FROM PUBLIC_SCHOOL_NSW_MASTER_DATASET;

ALTER TABLE MULTI_AGE_COMPOSITE_UNP RENAME TO MULTI_AGE_COMPOSITE_UNPIVOTED;

ALTER TABLE MULTI_AGE_COMPOSITE_UNPIVOTED 
RENAME COLUMN VALUE TO COMPOSITE_VALUE;

ALTER TABLE MULTI_AGE_COMPOSITE_UNPIVOTED 
ALTER COLUMN SCHOOL_CODE SET DATA TYPE BIGINT;

ALTER TABLE MULTI_AGE_COMPOSITE_UNPIVOTED 
ALTER COLUMN YEAR SET DATA TYPE INT;

UPDATE MULTI_AGE_COMPOSITE_UNPIVOTED
SET COMPOSITE_VALUE = NULL
WHERE COMPOSITE_VALUE = 'NULL';

ALTER TABLE MULTI_AGE_COMPOSITE_UNPIVOTED
ALTER COLUMN COMPOSITE_VALUE SET DATA TYPE FLOAT;

UPDATE PUBLIC_SCHOOL_NSW_MASTER_DATASET
SET PHONE = REPLACE(PHONE, ' ', '');

UPDATE PUBLIC_SCHOOL_NSW_MASTER_DATASET 
SET INDIGENOUS_PCT = NULL 
WHERE INDIGENOUS_PCT = 'NP';

ALTER TABLE PUBLIC_SCHOOL_NSW_MASTER_DATASET 
ALTER COLUMN INDIGENOUS_PCT SET DATA TYPE DOUBLE;

UPDATE PUBLIC_SCHOOL_NSW_MASTER_DATASET 
SET LBOTE_PCT = NULL 
WHERE LBOTE_PCT = 'NP';

ALTER TABLE PUBLIC_SCHOOL_NSW_MASTER_DATASET 
ALTER COLUMN LBOTE_PCT SET DATA TYPE DOUBLE;

UPDATE PUBLIC_SCHOOL_NSW_MASTER_DATASET
SET DATE_1ST_TEACHER = 
CASE 
    WHEN POSITION('/' IN DATE_1ST_TEACHER) > 0 THEN -- IF THE DATE CONTAINS A SLASH, IT'S IN THE DD/MM/YYYY FORMAT
        SUBSTR(DATE_1ST_TEACHER, 7, 4) || '-' || 
        SUBSTR(DATE_1ST_TEACHER, 4, 2) || '-' || L
        SUBSTR(DATE_1ST_TEACHER, 1, 2)
    ELSE 
        DATE_1ST_TEACHER 
END;

UPDATE PUBLIC_SCHOOL_NSW_MASTER_DATASET
SET DATE_1ST_TEACHER = CAST(DATE_1ST_TEACHER AS DATE);


UPDATE student_attendance_unpivoted 
SET ATTENDANCE_PCT = NULL 
WHERE ATTENDANCE_PCT IN ('SP');
ALTER TABLE STUDENT_ATTENDANCE_UNPIVOTED
ALTER COLUMN YEAR SET DATA TYPE INT;
ALTER TABLE student_attendance_unpivoted
ALTER COLUMN ATTENDANCE_PCT SET DATA TYPE DOUBLE;

SELECT * from student_attendance_unpivoted where ATTENDANCE_PCT ='SP';


ALTER TABLE STUDENT_ATTENDANCE_UNPIVOTED
ALTER COLUMN ATTENDANCE_PCT SET DATA TYPE DOUBLE;

SELECT COUNT(*) FROM SCHOOL_CHARACTERISTICS;

UPDATE MULTI_AGE_COMPOSITE_UNPIVOTED
SET COMPOSITE_VALUE = ROUND(COMPOSITE_VALUE, 2);

ALTER TABLE MULTI_AGE_COMPOSITE_UNPIVOTED
RENAME COLUMN SCHOOL_CODE TO SCHOOL_CODE;

ALTER TABLE PUBLIC_SCHOOL_NSW_MASTER_DATASET
RENAME COLUMN SCHOOL_CODE TO SCHOOL_CODE;






















