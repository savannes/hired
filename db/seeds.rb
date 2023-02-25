# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning the database"
Job.destroy_all
User.destroy_all

puts"Creating Users"

user_valentina = User.create!(email: "valentina@gmail.com", password: "1234abc")

puts"Creating Jobs"

google_dev = Job.new(user: user_valentina, company: "Google", role: "Front-end web developer", level: "Junior", description: "The role will include coding signed off designs into working web page templates in HTML5, CSS and JavaScript and then integrating those into content management systems.", status: "tries", type: "remote", salary: 4000, applycation_link: "www.google/jobs")
google_dev.save!

amazon_dev = Job.new(user: user_valentina, company: "Amazon", role: "Back-end web developer", level: "Junior", description: "You'll be involved in the entire product development lifecycle including the design, development, deployment and maintenance of new and existing features.", status: "replies", type: "remote", salary: 5000, applycation_link: "www.amazon/jobs")
amazon_dev.save!
