json.attendance do
  json.id attendance.id
  json.student_id attendance.user_id
  json.laboratory_class_id attendance.laboratory_class_id
  json.status attendance.status
end
