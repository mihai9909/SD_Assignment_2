return if object.errors.empty?

json.array! object.errors.full_messages do |error|
  json.message error
end
