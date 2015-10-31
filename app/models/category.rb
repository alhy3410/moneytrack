class Category < ActiveRecord::Base
  has_many :entries
  has_many :items
end
