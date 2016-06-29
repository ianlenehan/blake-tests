json.students @students do |student|

  json.student do
    json.first_name student.name_first
    json.last_name student.name_last
    json.teacher student.teacher.name_last
  end

  json.progress student.marks.each do |mark|
    json.lesson mark.lesson_id
    json.part mark.part
    json.mark mark.mark
  end

end
