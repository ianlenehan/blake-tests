require 'rails_helper'

RSpec.describe MarksController, type: :controller do

  describe 'POST to /marks' do
    describe 'a mark with valid information' do
      before do
        @student = Student.create
        Mark.destroy_all
        mark = {
          :mark => 85,
          :student_id => @student.id,
          :lesson_id => 1,
          :part => 1
        }
        post :create, :mark => mark, :id => @student.id
      end

      it 'should redirect to the student controller' do
        expect(response).to redirect_to(student_update_path(@student.id))
      end

      it 'should create a new mark' do
        expect(Mark.all.length).to eq(1)
      end
    end

  end

end
