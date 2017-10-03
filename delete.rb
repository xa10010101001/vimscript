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

Entry.where('name=?', ARGV[0]).delete_all
