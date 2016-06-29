Teacher.destroy_all
t1 = Teacher.create :title => 'Mr', :name_last => 'Murphy'
t2 = Teacher.create :title => 'Ms', :name_last => 'Jones'
t3 = Teacher.create :title => 'Mrs', :name_last => 'Lee'


Student.destroy_all
15.times do |n|
  s1 = Student.create :name_first => Faker::Name.first_name, :name_last => Faker::Name.last_name, :current_lesson => 1, :current_part => 1
  s1.teacher_id = t1.id
  s1.save
end

15.times do |n|
  s2 = Student.create :name_first => Faker::Name.first_name, :name_last => Faker::Name.last_name, :current_lesson => 1, :current_part => 1
  s2.teacher_id = t2.id
  s2.save
end

15.times do |n|
  s3 = Student.create :name_first => Faker::Name.first_name, :name_last => Faker::Name.last_name, :current_lesson => 1, :current_part => 1
  s3.teacher_id = t3.id
  s3.save
end

Lesson.destroy_all
(1..100).to_a.each do |i|
  Lesson.create :lesson_number => i, :parts => 3
end
