json.submission do
  json.id submission.id
  json.assignment_id submission.assignment_id
  json.user_id submission.user_id
  json.comment submission.comment
  json.link submission.link
  json.grade submission.grade
end
