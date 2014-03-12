namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Yoshiki",
    		 email: "stb_yoshiyuki-s@hotmail.co.jp",
		 password: "yoshiking",
		 password_confirmation: "yoshiking",
		 admin: true)

    99.times do |n|
      name = "User #{n+1}"
      email = "example-#{n+1}@railstutorial.jp"
      password = "password"
      User.create!(name: name,
      	   	   email: email,
		   password: password,
		   password_confirmation: password)
    end
  end
end