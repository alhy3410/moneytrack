# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = ["Auto and Transport", "Bills and Utilities", "Entertainment and Shopping", "Food and Dining", "Housing", "Misc"]

categories.each do |category|
  Category.create(name: category)
end

entries = [
  [1,"Car Payment"],
  [1,"Gas"],
  [1,"Auto Insurance"],
  [1,"Public Transport"],
  [1,"Taxis"],
  [1,"Rentals"],
  [2,"Internet"],
  [2,"Phone"],
  [2,"Water"],
  [2,"Electricity"],
  [2,"Gas"],
  [3,"Entertainment"],
  [3,"Shopping"],
  [4,"Groceries"],
  [4,"Restaurants"],
  [4,"Bars"],
  [4,"Store"],
  [5,"Rental Payment"],
  [5,"Home Payment"],
  [5,"Hotel Payment"],
  [5,"Hostel Payment"],
  [6,"Misc"]
]

entries.each do |category_id, name|
  Entry.create(category_id:  category_id, name: name)
end
