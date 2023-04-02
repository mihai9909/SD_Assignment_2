class AttendancesController < TeachersController
  before_action :require_teacher_laboratory
  before_action :find_attendance, only: [:update]

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      render 'show', status: :ok
    else
      render partial: 'errors', locals: { object: @attendance }, status: :unprocessable_entity
    end
  end

  def update
    if @attendance.update(attendance_params)
      render 'show', status: :ok
    else
      render partial: 'errors', locals: { object: @attendance }, status: :unprocessable_entity
    end
  end

  private
  def attendance_params
    params.require(:attendance).permit(:user_id, :laboratory_class_id, :status)
  end

  def find_attendance
    @attendance = Attendance.find(params[:id])
  end

  def require_teacher_laboratory
    raise ActiveRecord::RecordNotFound unless current_user.laboratory_classes.find_by(id: params[:attendance][:laboratory_class_id])
  end
end
