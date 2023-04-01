class LaboratoriesController < TeachersController
  before_action :find_laboratory, only: [:update, :destroy]

  def index
    @laboratories = current_user.laboratory_classes
  end

  def create
    @laboratory = LaboratoryClass.new(laboratory_params)
    @laboratory.teacher = current_user
    if @laboratory.save
      render partial: 'laboratory', locals: { laboratory: @laboratory }, status: :ok
    else
      render partial: 'errors', locals: { object: @laboratory }, status: :unprocessable_entity
    end
  end

  def update
    if @laboratory.nil?
      render json: { message: 'Laboratory not found' }, status: :not_found
    elsif @laboratory.update(laboratory_params)
      render partial: 'laboratory', locals: { laboratory: @laboratory }, status: :ok
    else
      render partial: 'errors', locals: { object: @laboratory }, status: :unprocessable_entity
    end
  end

  def destroy
    if @laboratory&.destroy
      render json: { message: 'Deleted successfuly' }, status: :ok
    else
      render json: { error: "Failed to delete" }, status: :not_found
    end
  end

  private
  def laboratory_params
    params.require(:laboratory).permit(:title, :laboratory_number, :description, :curriculum, :start_time)
  end

  def find_laboratory
    @laboratory = LaboratoryClass.where(teacher: current_user).find_by(id: params[:id])
  end
end
