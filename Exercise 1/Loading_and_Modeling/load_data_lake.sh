git clone https://github.com/divyasriram22/W205-GitHub.git
cd W205/Exercise\ 1/Loading_and_Modeling
ls
unzip hospital.zip
ls
du -s TEC.csv

n *; do
 if [ -d "$d" ]; then        
   ( cd "$d" && for x in *.csv; do sed '1d' "$x" > tmpfile; mv tmpfile "$x"; done )
 fi
done
