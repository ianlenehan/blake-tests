require 'rails_helper'

RSpec.describe MarksController, type: :controller do

  describe 'POST to /marks' do
    describe 'a mark with valid information' do
      before do
        student = Student.create
        post :create, { :mark => {:mark => 85} }, :id => student.id

      end

      it 'should redirect to the student controller' do
        expect(response).to redirect_to(student_update_path(1))
      end

    end

  end

end
