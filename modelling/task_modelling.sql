CREATE OR REPLACE VIEW school_master_data AS
SELECT 
    School_code, School_name, Town_suburb, Postcode, 
    LGA, ASGS_remoteness, AECG_region, Latitude, Longitude
FROM 
    public_school_nsw_master_dataset;

CREATE OR REPLACE VIEW school_attendance_data AS
SELECT 
    School_Code, Year, Attendance_pct
FROM 
    student_attendance_unpivoted;

CREATE OR REPLACE VIEW school_composite_data AS
SELECT 
    School_code, Year, Measure, Composite_Value
FROM 
    multi_age_composite_unpivoted;

CREATE OR REPLACE VIEW school_characteristics AS
SELECT 
    School_code, Level_of_schooling, Selective_school, Opportunity_class, 
    School_specialty_type, latest_year_enrolment_FTE, Indigenous_pct, LBOTE_pct, 
    School_subtype, Preschool_ind, Distance_education, Intensive_english_centre, 
    School_gender, Late_opening_school
FROM 
    public_school_nsw_master_dataset;


