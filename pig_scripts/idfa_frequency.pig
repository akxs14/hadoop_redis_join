REGISTER elephant-bird-pig-3.0.0.jar;
REGISTER json-simple-1.1.1.jar;

json_bid_reqs = LOAD '/history/ed_bid_requests/hourly/*.gz' using com.twitter.elephantbird.pig.load.JsonLoader('-nestedLoad') AS (json:map[]);
grouped_by_idfa = GROUP json_bid_reqs BY json#'idfa';
count_by_idfa = FOREACH grouped_by_idfa GENERATE group, COUNT(json_bid_reqs);
STORE count_by_idfa INTO '/tmp/angelos/idfa_count';
-- DUMP count_by_idfa;
