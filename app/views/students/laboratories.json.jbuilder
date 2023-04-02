json.laboratories @attendances do |attendance|
  json.attendance attendance.status
  json.laboratory attendance.laboratory_class.title
  json.laboratory_number attendance.laboratory_class.laboratory_number
  json.description attendance.laboratory_class.description
  json.start_time attendance.laboratory_class.start_time
  json.curriculum attendance.laboratory_class.curriculum
end
