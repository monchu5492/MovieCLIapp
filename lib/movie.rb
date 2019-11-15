class Movie < ActiveRecord::Base
    has_many :shows
    has_many :users, through: :shows
end