#!/usr/bin/env ruby

require 'active_record'
require 'io/console/size'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "/root/.vimdb.sqlite3"
)

class Entry < ActiveRecord::Base
end

Entry.select('*').each_with_index do |t, i|
  puts t.name
end 
