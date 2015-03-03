# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

list = List.create(:name => "Primary todo list")
Task.create(:name => "Take out trash", :description => "Take trash and bring it outside to garbage can.", :list_id => list.id, :priority => 8, :deadline => 1.day.from_now, :duration => 1, :favorite => false)
Task.create(:name => "Mow the lawn", :description => "Take lawn mower and move it back and forth on the grass.", :list_id => list.id, :priority => 4, :deadline => 5.days.from_now, :duration => 3, :favorite => false)
Task.create(:name => "Feed bunny", :description => "Take food and give it to our pet rabbit.", :list_id => list.id, :priority => 10, :deadline => Time.now, :duration => 1, :favorite => true)
