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

valentina = User.create!(first_name: "Valentina", last_name: "Hired", email: "valentina@gmail.com", password: "123qwe")
marina = User.create!(first_name: "Marina", last_name: "Lameirao", email: "marinalameirao@hotmail.com", password: "123qwe")
taisa = User.create!(first_name: "Taisa", last_name: "Silva", email: "taisa@travelmedia.com.br", password: "123qwe")
luis = User.create!(first_name: "Luis", last_name: "Campedelli", email: "vapeprosper@gmail.com", password: "123qwe")
savanne = User.create!(first_name: "Savanne", last_name: "Soares", email: "savannesoares88@gmail.com", password: "123qwe")


puts"Users Created"

puts "Creating fake Jobs"

roles = ["Full Stack", "Front-End", "Back-End"]
level = ["Junior", "Entry-level"]
job_type = ["Remote", "On site", "Hybrid"]
user = [valentina, marina, taisa, luis, savanne]

User.all.each do |user|
  user.columns.each do |column|
    rand(5..20).times do |n|
      job = Job.new(
        position: n,
        company: Faker::Company.name,
        column: column,
        role: roles.sample,
        level: level.sample,
        description: "Mussum Ipsum, cacilds vidis litro abertis. Mauris nec dolor in eros commodo tempor. Aenean aliquam molestie leo, vitae iaculis nisl.Paisis, filhis, espiritis santis.Leite de capivaris, leite de mula manquis sem cabeça.Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.",
        job_type: job_type.sample,
        salary: rand(800..1950),
        application_link: Faker::Internet.url
      )
      job.save!
      start_date = Time.now + rand(1..13).days + rand(1..13).hours
      CalendarEvent.create!(
        job: job,
        description: Faker::Movie.quote,
        name: job.company,
        starts_at: start_date,
        ends_at: start_date + rand(1..3).hours
      )
    end
  end
end

#google_dev = Job.create(user: user_valentina, company: "Google", role: "Front-end web developer", level: "Junior", description: "The role will include coding signed off designs into working web page templates in HTML5, CSS and JavaScript and then integrating those into content management systems.", status: 1, job_type: "remote", salary: 4000, application_link: "www.google/jobs")

#amazon_dev = Job.create(user: user_valentina, company: "Amazon", role: "Back-end web developer", level: "Junior", description: "You'll be involved in the entire product development lifecycle including the design, development, deployment and maintenance of new and existing features.", status: 2, job_type: "remote", salary: 5000, application_link: "www.amazon/jobs")

#face_dev = Job.create(user: user_valentina, company: "Face", role: "Back-end web developer", level: "Junior", description: "You'll be involved in the entire product development lifecycle including the design, development, deployment and maintenance of new and existing features.", status: 3, job_type: "remote", salary: 5000, application_link: "www.amazon/jobs")

puts"Jobs Created"
