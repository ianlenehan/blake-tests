require 'rails_helper'

RSpec.describe LessonsController, type: :controller do

  describe 'GET to /lessons' do

    before do
      3.times { |i| Lesson.create :lesson_number => i + 1 }
      get :index
    end

      it 'should respond with a status 200' do
        expect(response.status).to eq(200)
      end

      it 'should show us the lessons in an instance variable' do
        expect(assigns(:lessons)).to be
        expect(assigns(:lessons).length).to eq(3)
        expect(assigns(:lessons).first.class).to eq(Lesson)
        expect(assigns(:lessons).first.lesson_number).to eq(1)
      end

      it 'should render the index view' do
        expect(response).to render_template(:index)
      end

      it 'should be in numerical order' do
        expect(Lesson.last.lesson_number).to be > Lesson.first.lesson_number
      end
    end

    describe 'GET to /lessons/:id' do

      before do
        lesson = Lesson.create
        get :show, :id => lesson.id
      end

      it 'should render the show view' do
        expect(response).to render_template(:show)
      end
    end
  end
