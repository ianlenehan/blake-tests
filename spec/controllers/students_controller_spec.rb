require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  describe 'GET to /students' do

    before do
      Student.destroy_all
      3.times { |i| Student.create :name_first => "Student #{ i }" }
      get :index
    end

    it 'should respond with a status 200' do
      expect(response.status).to eq(200)
    end

      it 'should show us the students in an instance variable' do
        expect(assigns(:students).length).to eq(3)
        expect(assigns(:students)).to be
        expect(assigns(:students).first.class).to eq(Student)
      end

      it 'should render the index view' do
        expect(response).to render_template(:index)
      end

    end

    describe 'GET to /students/:id' do

      before do
        student = Student.create
        get :show, :id => student.id
      end

      it 'should render the show view' do
        expect(response).to render_template(:show)
      end
    end

    describe 'GET to /students/updatelesson/:id' do

      before do
        Student.destroy_all
        lesson = Lesson.create
        lesson.parts = 3
        lesson.lesson_number = 1
        lesson.save
        student = Student.create
        student.current_part = 1
        student.current_lesson = lesson.lesson_number
        student.save
        get :update_lesson, :id => student.id
      end

      it 'should increase the part number by 1' do
        expect(Student.last.current_part).to eq(2)
      end

    end
  end
