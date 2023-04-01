class StudentsController < ApplicationController
  before_action :require_student

  private
  def require_student
    raise ActiveRecord::RecordNotFound unless current_user.is_a?(Student)
  end
end
