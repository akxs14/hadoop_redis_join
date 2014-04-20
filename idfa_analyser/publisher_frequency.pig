REGISTER elephant-bird-pig-3.0.0.jar;
REGISTER json-simple-1.1.1.jar;

json_bid_reqs = LOAD 'ed_bid_requests.8.13.96152.3476283649' using com.twitter.elephantbird.pig.load.JsonLoader('-nestedLoad') AS (json:map[]);
grouped_by_publisher = GROUP json_bid_reqs BY json#'pub_name';
count_by_publisher = FOREACH grouped_by_publisher GENERATE group, COUNT(json_bid_reqs);
-- STORE grouped_by_publisher INTO '/Users/angelos/lab/hadoop_redis_join/idfa_analyser/publisher_count.txt';
DUMP count_by_publisher;