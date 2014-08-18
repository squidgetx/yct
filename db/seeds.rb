# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

8.times do
Climber.create! do |climber|
  climber.name = ["Riley Rice", "Juan Pablo", "Yanbo Li", "Dante Archangeli", "Grace Stonecipher"].sample
  climber.role = 'normal'
  climber.login = 'some login'
  climber.email = 'some email'
  climber.avatar = File.open(Dir.glob(File.join(Rails.root, 'db', 'seed_images', '*')).sample)
end
end

8.times do
  Post.create! do |post|
    post.title = "A post"
    post.text = ''
    [1,2,3,4,5,6].sample.times do
      post.text += 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n'
    end
    post.climber_id = 1;
  end
end
