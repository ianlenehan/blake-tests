class MarksController < ApplicationController
  def index
  end

  def create
    mark = Mark.create mark_params
    mark.save
    redirect_to student_update_path(mark.student_id)
  end

  private
  def mark_params
    params.require(:mark).permit(:mark, :student_id, :lesson_id, :part)
  end
end
