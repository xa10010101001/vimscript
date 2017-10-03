#!/usr/bin/env ruby

require 'active_record'

if ARGV.length < 3
  puts 'argv[0] : name argv[1] : path argv[2] : line'
  exit 1
end

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "/root/.vimdb.sqlite3"
)

class Entry < ActiveRecord::Base
end

entry = Entry.new do |t|
  t.name = ARGV[0]
  t.path = ARGV[1]
  t.line = ARGV[2].to_i
end
entry.save
