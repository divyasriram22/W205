from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

    def process(self, tup):
        word = tup.values[0]

	

	# Use psycopg to interact with Postgres
	conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        
	# Write codes to increment the word count in Postgres
	self.counts[word] += 1
	self.emit([word, self.counts[word]])        

        # update Database name: Tcount 
	
	cur = conn.cursor()
	
	cur.execute("INSERT INTO tweetwordcount (word,count) \
                SELECT %s, %s WHERE NOT EXISTS \
                (SELECT word FROM tweetwordcount WHERE word=%s)", (word, self.counts[word], word))
        cur.execute("UPDATE tweetwordcount SET count=%s WHERE word=%s", (self.counts[word], word))

	conn.commit()

        # Table name: Tweetwordcount 
        # you need to create both the database and the table in advance.
        

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
