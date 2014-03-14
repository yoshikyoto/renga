namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_haikus
    make_relationships
  end
end

def make_users
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

def make_haikus
    users = User.all(limit: 6)
    50.times do
      first_five = "12345"
      middle_seven = "1234567"
      last_five = "12345"
      users.each{ |user|
        user.haikus.create!(first_five: first_five,
			    middle_seven: middle_seven,
			    last_five: last_five) 
      }
    end
end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..40]
  followers = users[3..35]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each{ |follower| follower.follow!(user) }
end