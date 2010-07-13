#!/usr/bin/env ruby

require 'rubygems'
require 'bundler'
Bundler.setup

require 'twitter'

config = YAML.load_file(File.join(File.dirname(__FILE__), "account.yml"))["nomarebu"]

httpauth = Twitter::HTTPAuth.new(config["login"], config["password"])
client = Twitter::Base.new(httpauth)

s = File.read(File.join(File.dirname(__FILE__), "sake.txt")).split
client.update(s[rand(s.size)])
