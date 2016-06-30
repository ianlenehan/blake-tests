class StudentsController < ApplicationController
  def index
    @students = Student.all.order(:name_last)
  end

  def new
  end

  def edit
  end

  def show
    @student = Student.find params[:id]
  end

  def update_lesson
    student = Student.find params[:id]
    current_lesson = student.current_lesson
    lesson = Lesson.where(:lesson_number == current_lesson).first
    if student.current_part == lesson.parts
      p "first"
      student.current_lesson += 1
      student.current_part = 1
    else
      p "second"
      student.current_part += 1
    end
    student.save
    redirect_to student_path(student)
  end

end
