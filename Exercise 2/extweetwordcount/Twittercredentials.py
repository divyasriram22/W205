import tweepy

consumer_key = "PXn5dnv8CFoeQlkGZGgiVlnJT";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "W78SOlLYG5voqIHEdX0kOvK4blXnnnaiA34HdCYCR9KqhqHzRM";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "2884781997-RkmMjQnPoNe7ERGZvIINjl68aP944jzrqx3vlcD";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "quUYHYhEX0myzv7JMF4l7aFpeFf8DAGSLPqelv29pF0wn";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



