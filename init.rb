#!/usr/bin/env ruby

require 'active_record'

ActiveRecord::Base.establish_connection(
    "adapter" =>"sqlite3",
    "database" => "/root/.vimdb.sqlite3"
)

ActiveRecord::Base.connection.create_table('entries') do |t|
  t.text :name, null: false
  t.text :path, null: false
  t.integer :line, null: false
  t.column :created, 'DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP'
end

