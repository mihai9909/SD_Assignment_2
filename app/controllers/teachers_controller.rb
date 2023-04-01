class TeachersController < ApplicationController
  before_action :require_teacher

  private
  def require_teacher
    raise ActiveRecord::RecordNotFound unless current_user.is_a?(Teacher)
  end
end
