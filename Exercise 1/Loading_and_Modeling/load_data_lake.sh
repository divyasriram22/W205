#Divya Sriram W205 Exercise 1
#commands that I used in my terminal for the beginning of exercise 1

#removing spaces in file names (changing to _ )

for file in *; do mv "$file" `echo $file | tr ' ' '_' ; done

#creating a directory for each file
	#otherwise hive will pull all tables in one directory, so need separate one for each

find . -n "*.csv" -exec sh - c 'NEWDIR=`basename "$1" .csv` ; mkdir "$NEWDIR" ; mv "$" "$NEWDIR" ' _ {} \;

#put all files into git hub
git clone https://github.com/divyasriram22/W205-GitHub.git


for d in*; do
 if [ -d "$d" ]; then        
   ( cd "$d" && for x in *.csv; do sed '1d' "$x" > tmpfile; mv tmpfile "$x"; done )
 fi
done

#change names of important files

mv /home/w205/w205_exercise_1/Hospital_General_Information/Hospital_General_Information.csv /home/w205/w205_exercise_1/Hospital_General_Information/hospitals.csv

mv /home/w205/w205_exercise_1/Timely_and_Effective_Care_-_Hospital/Timely_and_Effective_Care_-_Hospital.csv /home/w205/w205_exercise_1/Timely_and_Effective_Care_-_Hospital/effective_care.csv

mv /home/w205/w205_exercise_1/Readmissions_and_Deaths_-_Hospital/Readmissions_and_Deaths_-_Hospital.csv /home/w205/w205_exercise_1/Readmissions_and_Deaths_-_Hospital/readmissions.csv


mv /home/w205/w205_exercise_1/Measure_Dates/Measure_Dates.csv /home/w205/w205_exercise_1/Measure_Dates/Measure.csv

mv /home/w205/w205_exercise_1/hvbp_hcahps_05_28_2015/hvbp_hcahps_05_28_2015.csv /home/w205/w205_exercise_1/hvbp_hcahps_05_28_2015/surveys_responses.csv


#take a look at hdfs current state

hdfs dfs -ls

#make directories inside hospital_compare in hadoop for each csv file

hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/Measures
hdfs dfs -mkdir /user/w205/hospital_compare/survey_responses

# put important files into the directories I created in Hospital Compare in HDFS
	#creating a hdfs data lake!!

hdfs dfs -put /home/w205/w205_exercise_1/Hospital_General_Information/hospitals.csv /user/w205/hospital_compare/hospitals

hdfs dfs -put /home/w205/w205_exercise_1/Timely_and_Effective_Care_-_Hospital/effective_care.csv /user/w205/hospital_compare/effective_care

hdfs dfs -put /home/w205/w205_exercise_1/Readmissions_and_Deaths_-_Hospital/readmissions.csv /user/w205/hospital_compare/readmissions

hdfs dfs -put /home/w205/w205_exercise_1/Measure_Dates/Measure.csv /user/w205/hospital_compare/Measures



