class StudentsController < ApplicationController
  before_action :require_student, only: [:create, :update, :destroy]

  def show
    @students = Student.all
  end

  private
  def require_student
    raise ActiveRecord::RecordNotFound unless current_user.is_a?(Student)
  end
end
