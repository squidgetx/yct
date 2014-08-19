require 'rake'

namespace :app do
  desc 'a rake task to set up the initial admin and configuration for the yct site'
  task setup: :environment do

    if Climber.all.empty?
      puts ''
      puts 'We need to start by creating an admin account. Please enter the'
      puts 'following info:'

      while !Climber.first
        puts ''
        puts 'Name:'
        first_name = STDIN.gets.chomp
        puts 'Login (i.e. NetID, please double check that this is correct):'
        login = STDIN.gets.chomp
        puts 'Email'
        email = STDIN.gets.chomp
        ActiveRecord::Base.transaction do
          begin
            Climber.create! do |u|
              u.name = first_name
              u.login = login
              u.role = 'admin'
              u.email = email
            end
          rescue Exception => e
            ActiveRecord::Rollback
            puts "Oops! Your admin account was not saved for the reasons listed below. Please"
            puts "double check that you're entering valid information for each item.\n"
            puts e
          end
        end # transaction

        if Climber.first
          puts "Your user was saved successfully! Now we'll set the application"
          puts "configurations."
        end
      end

      puts 'Enter the name of your organization'
      title = STDIN.gets.chomp
      puts 'What should the members of your organization be called? (eg swimmers, climbers, users)'
      name = STDIN.gets.chomp
      puts 'Enter some quick about text. You can edit this later'
      about = STDIN.gets.chomp
      AppConfig.create! do |a|
        a.title = title
        a.member_name = name
        a.about = about
      end

    else
      puts ''
      puts 'There appears to already be a user in the database. If you wish to run this'
      puts 'part of the setup script, please reset your database and run the'
      puts '$rake app:setup command again. You can use the command'
      puts '$rake db:migrate:reset to reset your database completely. WARNING: This will'
      puts 'delete any information that you have already stored in the database.'
    end
  end
end


