


These are the steps that need to be followed.

0. Download/create/move/delete the appropriate folders/files as the exercise states.
1. start your aws instance
2. mount data drive
3. start postgres
4. make sure hadoop is running
5. run psycho-sample.py (this is to ensure the database,tcount, and table, tweetwordcount, are created)
6. run hello-stream-twitter.py to make sure your API and credentials are ok
7. sparse run to start streaming (populate your database and table)
8. let streaming run for a while and the press control-c to stop streaming
9. run finalresults.py to test this file
10. run histogram.py to test this file

