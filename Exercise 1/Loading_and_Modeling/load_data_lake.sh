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

#take a look at hdfs current state

hdfs dfs -ls

#make directories inside hospital_compare in hadoop for each csv file

hdfs dfs -mkdir /user/w205/hospital_compare/

