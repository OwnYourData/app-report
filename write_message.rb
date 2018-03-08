#!/usr/bin/env ruby
# encoding: utf-8

require 'bunny'

input = ARGV.pop

# setup queue
conn = Bunny.new(:hostname => "192.168.178.21") #{}"oyd-rabbit")
conn.start
ch = conn.create_channel
q = ch.queue('tasks')
ch.default_exchange.publish(input, routing_key: q.name)