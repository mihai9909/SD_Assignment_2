class StudentController < ApplicationController
  before_action :require_student

  def require_student
    raise ActiveRecord::RecordNotFound unless current_user.is_a?(Student)
  end
end
