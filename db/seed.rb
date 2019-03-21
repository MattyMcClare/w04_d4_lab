require_relative('../models/student')
require_relative('../models/house')

gryffindor = House.new({
  'name' => 'Gryffindor',
  'logo' => nil
  })
gryffindor.save()

ravenclaw = House.new({
  'name' => 'Ravenclaw',
  'logo' => nil
  })
ravenclaw.save()

hufflepuff = House.new({
  'name' => 'Hufflepuff',
  'logo' => nil
  })
hufflepuff.save()

slytherin = House.new({
  'name' => 'Slytherin',
  'logo' => nil
  })
slytherin.save()

student1 = Student.new({
  'first_name' => 'Ron',
  'second_name' => 'Weasley',
  'house_id' => 1,
  'age' => 30
  })
student1.save

student2 = Student.new({
  'first_name' => 'Harry',
  'second_name' => 'Potter',
  'house_id' => 1,
  'age' => 14
  })
student2.save

student3 = Student.new({
  'first_name' => 'Draco',
  'second_name' => 'Malfoy',
  'house_id' => 4,
  'age' => 14
  })
student3.save
