#!/usr/bin/env ruby

require 'active_record'

if ARGV.length < 1
  puts 'argv[0] : name'
  exit 1
end

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "/root/.vimdb.sqlite3"
)

class Entry < ActiveRecord::Base
end

Entry.select('*').where('name=?', ARGV[0]).each do |t|
  puts t.path + ':' + t.line.to_s
end 
