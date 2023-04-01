class StudentsController < ApplicationController
  before_action :require_teacher, only: [:create, :update, :destroy]
  before_action :find_student, only: [:update, :destroy, :register]

  def register
    if @student && @student.student_profile.valid_token?(params[:student][:token]) && !@student.student_profile.active?
      @student.attributes = student_params
      @student.student_profile.active = true
      if @student.save
        render 'show', status: :ok
      else
        render partial: 'errors', locals: { object: @student }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Incorrect token' }
    end
  end

  def index
    @students = Student.all
  end

  def update
    if @student.nil?
      render json: { message: 'Student not found' }, status: :not_found
    elsif @student.update(student_params)
      render 'show', status: :ok
    else
      render partial: 'errors', locals: { object: @student }, status: :unprocessable_entity
    end
  end

  def destroy
    if @student&.destroy
      render json: { message: 'Deleted successfuly' }, status: :ok
    else
      render json: { error: "Failed to delete" }, status: :not_found
    end
  end

  def create
    @student = Student.new(student_params)
    @student.build_student_profile.generate_token!
    if @student.save
      render 'show', status: :ok
    else
      render partial: 'errors', locals: { object: @student }, status: :unprocessable_entity
    end
  end

  private
  def require_teacher
    raise ActiveRecord::RecordNotFound unless current_user.is_a?(Teacher)
  end

  def student_params
    params.require(:student).permit(:email, :password, student_profile_attributes: [:full_name, :hobby])
  end

  def find_student
    @student = Student.find_by(id: params[:id])
  end
end
