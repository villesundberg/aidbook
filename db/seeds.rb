# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

ilona = Person.create(:name => 'Ilona', :img_url => 'http://a2.twimg.com/profile_images/1213397923/29685_466076618848_506993848_5885618_4425118_n_normal.jpg')
markus = Person.create(:name => 'Markus', :img_url => 'http://a2.twimg.com/profile_images/1215503867/image_normal.jpg')

cover = Project.create(:name => 'Cover Sydney', :map_point => [-33.84675716694653, 151.02577490234376])
drying = Project.create(:name => 'Drying Toowoomba', :map_point => [-27.565813674278495, 152.00905126953126])

ilona.projects << cover
tw = Status.create(:status => "Toowoomba kaboom!", :time => DateTime.now )
ilona.statuses << tw
ilona.save

markus.projects << drying
markus.statuses << Status.create(:status => "Plenty of cover over Sydney rain!", :time => DateTime.now )
markus.statuses << Status.create(:status => "Add some more!", :time => DateTime.now )
markus.friends << ilona
markus.save
