import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
import sys


#Connecting to tcount

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

#Create a Table
#The first step is to create a cursor. 

#cur = conn.cursor()
#cur.execute("DROP TABLE IF EXISTS tweetwordcount;")
#cur.execute('''CREATE TABLE tweetwordcount
#      (word TEXT PRIMARY KEY     NOT NULL,
#       count INT     NOT NULL);''')
#conn.commit()



program = sys.argv[0]
args = sys.argv[1:]
arg_value = len(args)




#situation when no argument is passed --> script for SQL to pass back 
if arg_value == 0:
	cur.execute("SELECT word, count from tweetwordcount ORDER BY word")
	records = cur.fetchall()
	for record in records:
		print(record[0], record[1])
	conn.commit()
	conn.close()	


#situation where exactly 1 argument is passed --> script for SQL to return the count of how many times the word occurred
elif arg_value == 1:
	word = str(args[0])
	counter = 0

    	cur.execute("SELECT word, count FROM tweetwordcount WHERE word=%s",(word,))
	records = cur.fetchall()
	for record in records:
		if record[0] == word:
			print"Total number of occurrences of \"%s\": %d" %(record[0], record[1])
			counter =+ 1

	if counter == 0:
		print"The following word has no occurrences:%s" %word
	conn.commit()
	conn.close()

#sitaution when multiple arguments are passed --> exit program
elif arg_value > 1:
	print ("Please enter 1 argument (1word) or no argument at all")
	exit()






