require 'bundler'
Bundler.require

require_all 'bin'
require_all 'lib'
require_all 'db'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

