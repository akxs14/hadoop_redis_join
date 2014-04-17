# encoding: utf-8
require 'redis'
require 'json'

def read_file filename
  File.open(filename, 'r') do |f|
    f.each_line do |line|
      yield line
    end
  end
end

def is_impression? event
  event["ais"] == 1
end

def resulted_in_click? redis, event
  redis.hget("clicks", event["tx"]) == event["tx"]
end

def match_ai_click redis, event
  if resulted_in_click?(redis, event)
    print "."
    event["clicks"] = 1
  end
end

redis = Redis.new(:host => "localhost", :port => 6379, :db => 1)

puts "store clicks in redis"
read_file("historical_test_file") do |line|
  parsed_line = JSON.parse(line)
  if parsed_line["clicks"] == 1
    print "."
    redis.hset("clicks", parsed_line["tx"], parsed_line["tx"])
  end
end

out_file = File.open("clicks_impressions.txt", "w")

puts "\nstore clicks in redis"
read_file("historical_test_file") do |line|
  parsed_line = JSON.parse(line)
  if is_impression?(parsed_line)
    out_file.write(match_ai_click(redis,parsed_line).to_s + "\n")
  end
end

