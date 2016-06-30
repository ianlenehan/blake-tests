require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  describe 'GET to /students' do

    before do
      student1 = Student.create
      student2 = Student.create
      get :index
    end

      it 'should respond with a status 200' do
        expect(response.status).to eq(200)
      end

      it 'should show us the students in an instance variable' do
        expect(assigns(:students)).to be
        expect(assigns(:students).length).to eq(2)
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
  end
