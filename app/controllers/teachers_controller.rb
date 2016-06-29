class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find params[:id]
    @students = Student.where(:teacher_id => @teacher.id).order(:name_last)
  end

  def reports
    @teacher = Teacher.find params[:id]
    @students = Student.where(:teacher_id => @teacher.id).order(:name_last)
  end

end
