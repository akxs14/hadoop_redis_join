REGISTER elephant-bird-pig-3.0.0.jar;
REGISTER json-simple-1.1.1.jar;

SET pig.maxCombinedSplitSize 250000000;

json_bid_reqs = LOAD '/history/ed_reports/hourly/2014/*/*/*' using com.twitter.elephantbird.pig.load.JsonLoader('-nestedLoad') AS (json:map[]);
json_bid_reqs_rtb = FILTER json_bid_reqs BY json#'rtb' == true;
grouped_by_idfa = GROUP json_bid_reqs_rtb BY json#'idfa';
count_by_idfa = FOREACH grouped_by_idfa GENERATE group, COUNT(json_bid_reqs_rtb);
-- STORE count_by_idfa INTO '/tmp/angelos/idfa_count/2014';
DUMP count_by_idfa;
 