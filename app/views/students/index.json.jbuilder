json.students @students do |student|
  json.id student.id
  json.email student.email
  json.student_profile do
    json.name student.student_profile.full_name
    json.hobby student.student_profile.hobby
  end
end
