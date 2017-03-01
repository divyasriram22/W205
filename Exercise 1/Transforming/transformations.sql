vya Sriram W205 Exercise 1
-- Transformation of Hive Tables


DROP TABLE hospitals_table_t;
CREATE TABLE hospitals_table_t AS
        SELECT CAST(provider_id as int) provider_id,
        UPPER(hospital_name) hospital_name,
        UPPER(address) address,
        UPPER(city) city,
        UPPER(state) state,
        CAST(zip as int) zip,
        UPPER(county) as county,
        phone phone,
        UPPER(hospital_type) hospital_type,
        UPPER(ownership) ownership,
        CASE WHEN emergecy_svs = 'Yes' THEN 1 ELSE 0 END emergency_svs
        FROM hospitals_table;

DROP TABLE effective_care_table_t;
CREATE TABLE effective_care_table_t AS
        SELECT CAST(provider_id as int) provider_id,
        UPPER(hospital_name) hospital_name,
        UPPER(address) address,
        UPPER(city) city,
        UPPER(state) state,
        CAST(zip as int) zip,
        UPPER(county) as county,
        phone phone,
        UPPER(condition) condition,
        UPPER(measure_id) measure_id,
        UPPER(measure_name) measure_name,
        CAST (score as int) score,
        CAST (sample as int) sample
        FROM effective_care_table;


DROP TABLE readmissions_table_t;
CREATE TABLE readmissions_table_t AS
        SELECT CAST(provider_id as int) provider_id,
        UPPER(hospital_name) hospital_name,
        UPPER(address) address,
        CAST(zip as int) zip,
        UPPER(county) as county,
        phone phone,
        CAST(denominator AS INT) denominator,
        CAST(score AS FLOAT) score,
        CAST(lower_estimate AS FLOAT) lower_estimate,
        CAST(higher_estimate AS FLOAT) higher_estimate
        FROM readmissions_table;

DROP TABLE measures_table_t;
CREATE TABLE measures_table_t AS
        SELECT
        UPPER(measure_name) measure_name,
        UPPER(measure_id) measure_id,
        UPPER(measure_start_quarter) measure_start_quarter,
        to_date(measure_start_date) measure_start_date,
        UPPER(measure_end_quarter) measure_end_quarter,
        to_date(measure_end_date) measure_end_date
        FROM measures_table;





DROP TABLE survey_responses_table_t;
CREATE TABLE survey_responses_table_t AS
        SELECT CAST(provider_id as int) provider_id,
        UPPER(hospital_name) hospital_name,
        UPPER(address) address,
        UPPER(city) city,
        UPPER(state) state,
        CAST(zip as int) zip,
        UPPER(county) as county,
        CAST(base_score as int) base_score,
        CAST(consistency_score as int) consistency_score
        FROM survey_responses_table;
