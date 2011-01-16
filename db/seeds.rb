# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

ilona = Person.create(:name => 'Ilona', :img_url => 'http://a2.twimg.com/profile_images/1213397923/29685_466076618848_506993848_5885618_4425118_n_normal.jpg')
markus = Person.create(:name => 'Markus', :img_url => 'http://a2.twimg.com/profile_images/1215503867/image_normal.jpg')

cover = Project.create(
                       :name => 'Cover Sydney',
                       :map_point => [-33.84675716694653, 151.02577490234376],
                       :beginning => Date::civil(2010,1,1),
                       :ending => Date::civil(2010,10,10)
                       )

drying = Project.create(
                        :name => 'Drying Toowoomba',
                        :map_point => [-27.565813674278495, 152.00905126953126],
                        :beginning => Date::civil(2010,1,1),
                        :ending => Date::civil(2011,10,10)
                        )

soaking = Project.create(
                         :name => 'Soaking Nigeria',
                         :map_point => [1.565813674278495, 52.00905126953126],
                         :beginning => Date::civil(2012,1,1),
                         :ending => Date::civil(2012,10,10)
                         )

ilona.projects << cover
tw = Status.create(:status => "Toowoomba kaboom!", :time => DateTime.now )
ilona.statuses << tw
ilona.save

r1 = Role.create(:title => "Project manager")

drying.roles << r1
markus.roles << r1

r2 = Role.create(:title => "Project coordinator")

drying.roles << r2
ilona.roles << r2



markus.statuses << Status.create(:status => "Plenty of cover over Sydney rain!", :time => DateTime.now )
markus.statuses << Status.create(:status => "Add some more!", :time => DateTime.now )
markus.friends << ilona
markus.save

ilona.save
