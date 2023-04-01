json.student do
  json.id @student.id
  json.email @student.email
  json.student_profile do
    json.token @student.student_profile.token
    json.active @student.student_profile.active
  end
end
json.errors do
  json.partial! partial: 'errors', locals: { object: @student }
end
