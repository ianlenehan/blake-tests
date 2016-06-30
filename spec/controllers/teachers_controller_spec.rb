require 'rails_helper'

RSpec.describe TeachersController, type: :controller do

  describe 'GET to /teachers' do

    before do
      teacher1 = Teacher.create
      teacher2 = Teacher.create
      get :index
    end

      it 'should respond with a status 200' do
        expect(response.status).to eq(200)
      end

      it 'should show us the teachers in an instance variable' do
        expect(assigns(:teachers)).to be
        expect(assigns(:teachers).length).to eq(2)
        expect(assigns(:teachers).first.class).to eq(Teacher)
      end

      it 'should render the index view' do
        expect(response).to render_template(:index)
      end

    end

    describe 'GET to /teachers/:id' do

      before do
        teacher = Teacher.create
        get :show, :id => teacher.id
      end

      it 'should render the show view' do
        expect(response).to render_template(:show)
      end
    end

  end
