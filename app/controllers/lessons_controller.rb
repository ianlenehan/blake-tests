class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all.order(:lesson_number)
  end

  def edit
    @lesson = Lesson.find params[:id]
  end

  def show
    @lesson = Lesson.find params[:id]
  end

  def update
    lesson = Lesson.find params[:id]
    lesson.update lesson_params
    redirect_to lesson
  end

  def lesson_params
    params.require(:lesson).permit(:parts)
  end
end
