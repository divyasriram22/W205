import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")


program = sys.argv[0]
args = sys.argv[1:]
arg_value = len(args)

#converting arguments into integers
arg_1 = int(args[0])
arg_2 = int(args[1])

#upper and lower boundries for the SQL query.
if arg_1 < arg_2:
    lower = arg_1
    upper = arg_2
else:
    upper = arg_1
    lower = arg_2


#print all words and counts according to rules and bounds.
cur = conn.cursor()
cur.execute("SELECT word, count from tweetwordcount WHERE count BETWEEN %s AND %s ORDER BY count DESC, word", (lower, upper))
records = cur.fetchall()
for record in records:
   print(record[0], record[1])
conn.commit()


#if not correct arguments are passed
if arg_value != 2:
    print("Please enter two integers in the CLI the next time you run this program.")
    exit()
