class TeacherController < ApplicationController
  before_action :require_teacher

  def require_student
    raise ActiveRecord::RecordNotFound unless current_user.is_a?(Teacher)
  end
end
