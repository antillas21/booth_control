# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

admin = User.create(:name => "Admin", :email => 'antillas21@gmail.com', :password => '123456',
:password_confirmation => '123456')
User.first.update_attribute(:admin, true)

Map.create!(:map_file => "path/to/map.swf", :zoom => "400%", :zoom_x => "300%", :zoom_y => "200%")
ExhibitorType.create!(:name => "Expositor")