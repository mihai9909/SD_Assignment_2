class AssignmentsController < TeachersController
  before_action :find_assignment, only: [:update, :destroy]
  before_action :require_teacher_laboratory, only: [:create, :update, :destroy]

  def index
    @assignments = current_user.assignments
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.laboratory_class_id = params[:id]
    if @assignment.save
      render 'show', status: :ok
    else
      render partial: 'errors', locals: { object: @assignment }, status: :unprocessable_entity
    end
  end

  def update
    if @assignment.update(assignment_params)
      render 'show', status: :ok
    else
      render partial: 'errors', locals: { object: @assignment }, status: :unprocessable_entity
    end
  end

  def destroy
    if @assignment&.destroy
      render json: { message: 'Deleted successfuly' }, status: :ok
    else
      render json: { error: "Failed to delete" }, status: :not_found
    end
  end
  
  private
  def assignment_params
    params.require(:assignment).permit(:name, :description, :deadline, :laboratory_class_id)
  end

  def require_teacher_laboratory
    raise ActiveRecord::RecordNotFound unless current_user.laboratory_classes.find_by(id: params[:id])
  end

  def find_assignment
    @assignment = current_user.assignments.find_by(id: params[:id])
  end
end
