require 'bundler'
Bundler.require

#require_all 'bin'
require_all 'lib'
# require_all 'db'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: '/Users/tannerpatterson/Development/code/ruby-project-guidelines-seattle-web-102819/db/development.db')

ActiveRecord::Base.logger = nil