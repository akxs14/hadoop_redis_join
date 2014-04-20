REGISTER '/Users/angelos/lab/hadoop_redis_join/idfa_analyser/elephant-bird-core-3.0.5.jar';
REGISTER '/Users/angelos/lab/hadoop_redis_join/idfa_analyser/elephant-bird-hadoop-compat-4.1.jar';
REGISTER '/Users/angelos/lab/hadoop_redis_join/idfa_analyser/json-simple-1.1.1.jar';

bid_requests = LOAD 'ed_bid_requests.8.13.96152.3476283649' using com.twitter.elephantbird.pig.load.JsonLoader();
DUMP bid_requests;
