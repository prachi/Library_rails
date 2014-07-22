namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(username: "Prachi",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
    80.times do |n|
      username  = Faker::Name.name
      password  = "password"
      User.create!(username: username,
                   password: password,
                   password_confirmation: password)
    end
  end
end
