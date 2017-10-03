#!/usr/bin/env ruby

require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "/root/.vimdb.sqlite3"
)

class Entry < ActiveRecord::Base
end

Entry.select('*').each do |t|
  puts t.name + ":"
  puts t.path + ':' + t.line.to_s
  puts
end 
