DIVYA SRIRAM W205 EXERCISE 1 HIVE_BASE_DDL.SH


show tables;

-- Create a Table for Hospitals. csv */
DROP TABLE hospitals_table;
CREATE EXTERNAL TABLE hospitals_table (
provider_id STRING,
hospital_name STRING,
address STRING,
city STRING,
state STRING,
zip STRING,
county STRING,
phone STRING,
hospital_type STRING,
ownership STRING,
emergecy_svs STRING)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES("separatorChar" = ",", "quoteChar" = '"', "escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

-- Create a Table for Effective Care.csv */
DROP TABLE effective_care_table;
CREATE EXTERNAL TABLE effective_care_table (
provider_id STRING,
hospital_name STRING,
address STRING,
city STRING,
state STRING,
zip STRING,
county STRING,
phone STRING,
condition STRING,
measure_id STRING,
measure_name STRING,
score STRING,
sample STRING,
footnote STRING,
measure_start_date STRING,
measure_end_date STRING)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES("separatorChar" = ",", "quoteChar" = '"', "escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';

-- Create a Table for readmissions.csv 
DROP TABLE readmissions_table;
CREATE EXTERNAL TABLE readmissions_table (
provider_id STRING,
hospital_name STRING,
address STRING,
city STRING,
state STRING,
zip STRING,
county STRING,
phone STRING,
measure_name STRING,
measure_id STRING,
compared_to_national STRING,
denominator STRING,
score STRING,
lower_estimate STRING,
higher_estimate STRING,
footnote STRING,
measure_start_date STRING,
measure_end_date STRING)


ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES("separatorChar" = ",", "quoteChar" = '"', "escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';

-- Create a Table for Measures . csv
DROP TABLE measures_table;
CREATE EXTERNAL TABLE measures_table (
measure_name STRING,
measure_id STRING,
measure_start_quarter STRING,
measure_start_date STRING,
measure_end_quarter STRING,
measure_end_date STRING)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES("separatorChar" = ",", "quoteChar" = '"', "escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';



-- Create a table for survey responses.csv

DROP TABLE survey_responses_tables;
CREATE EXTERNAL TABLE survey_responses_table (
provider_id STRING,
hospital_name STRING,
address STRING,
city STRING,
state STRING,
zip STRING,
county STRING,
communication_with_nurses_floor STRING,
communication_with_nurses_achievement_threshold STRING,
communication_with_nurses_benchmark STRING,
communication_with_nurses_baseline_rate STRING,
communication_with_nurses_performance_rate STRING,
communication_with_nurses_achievement_points STRING,
communication_with_nurses_improvement_points STRING,
communication_with_nurses_dimension_score STRING,
communication_with_doctors_floor STRING,
communication_with_doctors_achievement_threshold STRING,
communication_with_doctors_benchmark STRING,
communication_with_doctors_baseline_rate STRING,
communication_with_doctors_performance_rate STRING,
communication_with_doctors_achievement_points STRING,
communication_with_doctors_improvement_points STRING,
communication_with_doctors_dimension_score STRING,
responsiveness_of_hospital_staff_floor STRING,
responsiveness_of_hospital_staff_achievement_threshold STRING,
responsiveness_of_hospital_staff_benchmark STRING,
responsiveness_of_hospital_staff_baseline_rate STRING,
responsiveness_of_hospital_staff_performance_rate STRING,
responsiveness_of_hospital_staff_achievement_points STRING,
responsiveness_of_hospital_staff_improvement_points STRING,
responsiveness_of_hospital_staff_dimension_score STRING,
pain_management_floor STRING,
pain_management_achievement_threshold STRING,
pain_management_benchmark STRING,
pain_management_baseline_rate STRING,
pain_management_performance_rate STRING,
pain_management_achievement_points STRING,
pain_management_improvement_points STRING,
pain_management_dimension_score STRING,communication_about_medicines_floor STRING,
communication_about_medicines_achievement_threshold STRING,
communication_about_medicines_benchmark STRING,
communication_about_medicines_baseline_rate STRING,
communication_about_medicines_performance_rate STRING,
communication_about_medicines_achievement_points STRING,
communication_about_medicines_improvement_points STRING,
communication_about_medicines_dimension_score STRING,
cleanliness_and_quietness_of_hospital_environment_floor STRING,
cleanliness_and_quietness_of_hospital_environment_achievement_threshold STRING,
cleanliness_and_quietness_of_hospital_environment_benchmark STRING,
cleanliness_and_quietness_of_hospital_environment_baseline_rate STRING,
cleanliness_and_quietness_of_hospital_environment_performance_rate STRING,
cleanliness_and_quietness_of_hospital_environment_achievement_points STRING,
cleanliness_and_quietness_of_hospital_environment_improvement_points STRING,
cleanliness_and_quietness_of_hospital_environment_dimension_score STRING,
discharge_information_floor STRING,
discharge_information_achievement_threshold STRING,
discharge_information_benchmark STRING,
discharge_information_baseline_rate STRING,
discharge_information_performance_rate STRING,
discharge_information_achievement_points STRING,
discharge_information_improvement_points STRING,
discharge_information_dimension_score STRING,
overall_rating_of_hospital_floor STRING,
overall_rating_of_hospital_achievement_threshold STRING,
overall_rating_of_hospital_benchmark STRING,
overall_rating_of_hospital_baseline_rate STRING,
overall_rating_of_hospital_performance_rate STRING,
overall_rating_of_hospital_achievement_points STRING,
overall_rating_of_hospital_improvement_points STRING,
overall_rating_of_hospital_dimension_score STRING,
base_score STRING,
consistency_score STRING)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES("separatorChar" = ",", "quoteChar" = '"', "escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/survey_responses';
