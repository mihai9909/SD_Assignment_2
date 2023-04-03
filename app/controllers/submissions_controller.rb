class SubmissionsController < ApplicationController
  before_action :require_student
  before_action :find_submission, only: [:show, :update, :destroy]

  def update
    if @submission.update(submission_params)
      render 'show', status: :ok
    else
      render partial: 'errors', locals: { object: @submission }, status: :unprocessable_entity
    end
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.assignment = current_user.assignments.find_by(id: params[:id])
    @submission.student = current_user
    if @submission.save
      render 'show', status: :ok
    else
      render partial: 'errors', locals: { object: @submission }, status: :unprocessable_entity
    end
  end

  def destroy
    if @submission&.destroy
      render json: { message: 'Deleted successfuly' }, status: :ok
    else
      render json: { error: "Failed to delete" }, status: :not_found
    end
  end

  private
  def submission_params
    params.require(:submission).permit(:link, :comment)
  end

  def find_submission
    @submission = current_user.submissions.find(params[:id])
  end

  def require_student
    raise ActiveRecord::RecordNotFound unless current_user.is_a?(Student)
  end
end
