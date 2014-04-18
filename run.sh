#!/bin/bash
hadoop fs -cat /events/info.json | ruby logs_between.rb -2.weeks +1.day | time hadoop jar build/hadoop_redis_join.jar collect_ids
