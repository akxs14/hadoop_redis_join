# encoding: utf-8
require 'java'
require 'jrjackson'

module Collect_ids

  class Mapper

    def map key, value, context
      json = JrJackson::Json.parse(value.to_s)

      if json["idfa"]
        htx = Hadoop::Io::Text.new('')
        context.write(htx, Hadoop:Io::IntWritable.new(1))
      end
    end

    def reduce key, values, context
      sum = 0
      values.each {|value| sum += value.get}
      context.write(key, Hadoop::Io::IntWritable.new(sum))
    end

  end

end