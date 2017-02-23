#DIVYA SRIRAM W205 EXERCISE 1 LOAD_DATA_LAKE.SH
# followed amit's example -- this is such a convenient way to do it!!


# INITIAL INSTRUCTIONS (script assumes user has done this)
# starting at /home/w205/hospital_compare


#!/bin/bash

# MAKE NEEDED DIRECTORIES BOTH IN AWS AND HDFS

mkdir raw_data
mkdir workable_data
hdfs dfs -mkdir hospital_compare

# DOWNLOADING DATA
wget  https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip


unzip 6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip; charset=binary

rm 6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip; charset=binary


#RENAMING FILE NAMES WITHOUT SPACES

for file in *; do mv "$file" `echo $file | tr ' ' '_'` ; done


##### EDIT THE 5 MOST IMPORTANT FILES ##

cd /home/w205/hospital_care
mkdir

HOSP_DIREC = '/home/w205/hospital_care/'
RAW_DATA = $HOSP_DIRECT'raw_data/'
RENAME_H_STRIP_DATA = $HOSP_DIRECT'workable_data/' # data files here are renamed, header stripped, no spaces


#create directory

####### HOSPITALS.CSV ######

raw_data_file = 'Hospital_General_Information.csv'
rename_h_strip_file = 'hospitals.csv' 
hdfs_direc = hospitals

cp "$RAW_DATA$raw_data_file" "$RENAME_H_STRIP_DATA$rename_h_strip_file"
tail -n +2 "RENAME_H_STRIP_DATA$rename_h_strip_file" > "$RENAME_H_STRIP_DATA$rename_h_strip_file"

ls $RENAME_H_STRIP_DATA

#create directory in hdfs and move file to hdfs

hdfs dfs -mkdir hospital_compare/$hdfs_dir
hdfs dfs -put "$RENAME_H_STRIP_DATA$rename_h_strip_file" hospital_compare/$hdfs_dir
hdfs dfs -ls hospital_compare/$hdfs_dir



##### EFFECTIVE_CARE.CSV #####

raw_data_file = 'Timely_and_Effective_Care_-_Hospital.csv'
rename_h_strip_file = 'effective_care.csv'
hdfs_direc = effective_care

cp "$RAW_DATA$raw_data_file" "$RENAME_H_STRIP_DATA$rename_h_strip_file"
tail -n +2 "RENAME_H_STRIP_DATA$rename_h_strip_file" > "$RENAME_H_STRIP_DATA$rename_h_strip_file"

ls $RENAME_H_STRIP_DATA

#create directory in hdfs and move file to hdfs

hdfs dfs -mkdir hospital_compare/$hdfs_dir
hdfs dfs -put "$RENAME_H_STRIP_DATA$rename_h_strip_file" hospital_compare/$hdfs_dir
hdfs dfs -ls hospital_compare/$hdfs_dir



#### READMISSIONS.CSV #######


raw_data_file = 'Readmissions_and_Deaths_-_Hospital.csv'
rename_h_strip_file = 'readmissions.csv'
hdfs_direc = readmissions

cp "$RAW_DATA$raw_data_file" "$RENAME_H_STRIP_DATA$rename_h_strip_file"
tail -n +2 "RENAME_H_STRIP_DATA$rename_h_strip_file" > "$RENAME_H_STRIP_DATA$rename_h_strip_file"

ls $RENAME_H_STRIP_DATA

#create directory in hdfs and move file to hdfs

hdfs dfs -mkdir hospital_compare/$hdfs_dir
hdfs dfs -put "$RENAME_H_STRIP_DATA$rename_h_strip_file" hospital_compare/$hdfs_dir
hdfs dfs -ls hospital_compare/$hdfs_dir


##### MEASURES.CSV #########


raw_data_file = 'Measure_Dates.csv'
rename_h_strip_file = 'measures.csv'
hdfs_direc = measures

cp "$RAW_DATA$raw_data_file" "$RENAME_H_STRIP_DATA$rename_h_strip_file"
tail -n +2 "RENAME_H_STRIP_DATA$rename_h_strip_file" > "$RENAME_H_STRIP_DATA$rename_h_strip_file"

ls $RENAME_H_STRIP_DATA 

#create directory in hdfs and move file to hdfs

hdfs dfs -mkdir hospital_compare/$hdfs_dir
hdfs dfs -put "$RENAME_H_STRIP_DATA$rename_h_strip_file" hospital_compare/$hdfs_dir
hdfs dfs -ls hospital_compare/$hdfs_dir


##### SURVEYS_RESPONSES ########

raw_data_file = 'hvbp_hcahps_11_10_2016.csv'
rename_h_strip_file = 'survey_responses.csv'
hdfs_direc = survey_responses

cp "$RAW_DATA$raw_data_file" "$RENAME_H_STRIP_DATA$rename_h_strip_file"
tail -n +2 "RENAME_H_STRIP_DATA$rename_h_strip_file" > "$RENAME_H_STRIP_DATA$rename_h_strip_file"

ls $RENAME_H_STRIP_DATA

#create directory in hdfs and move file to hdfs

hdfs dfs -mkdir hospital_compare/$hdfs_dir
hdfs dfs -put "$RENAME_H_STRIP_DATA$rename_h_strip_file" hospital_compare/$hdfs_dir
hdfs dfs -ls hospital_compare/$hdfs_dir


