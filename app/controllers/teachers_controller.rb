class TeachersController < ApplicationController
  before_action :require_teacher

  def create
    @student = Student.new(student_params)
    @student.build_student_profile.generate_token!
    render partial: 'errors', locals: { object: @student }, status: :unprocessable_entity unless @student.save
  end

  private
  def require_teacher
    raise ActiveRecord::RecordNotFound unless current_user.is_a?(Teacher)
  end

  def student_params
    params.require(:student).permit(:email, :password)
  end
end
