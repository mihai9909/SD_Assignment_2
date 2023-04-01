class StudentsController < ApplicationController
  before_action :require_teacher, only: [:create, :update, :destroy]

  def index
    @students = Student.all
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      render status: :ok
    else
      render status: :not_found
    end
  end

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
