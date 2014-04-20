REGISTER elephant-bird-pig-3.0.0.jar;
REGISTER json-simple-1.1.1.jar;

bid_requests = LOAD 'ed_bid_requests.8.13.96152.3476283649' using com.twitter.elephantbird.pig.load.JsonLoader();
DUMP bid_requests;

