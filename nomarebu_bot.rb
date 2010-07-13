#!/usr/bin/env ruby

require 'rubygems'
require 'bundler'
Bundler.setup
Bundler.require :default

config = YAML.load_file(File.expand_path("../account.yml", __FILE__))["nomarebu"]

httpauth = Twitter::HTTPAuth.new(*config.values_at("login", "password"))
client = Twitter::Base.new(httpauth)

s = File.read(File.expand_path("../sake.txt", __FILE__)).split
client.update(s.choice)
