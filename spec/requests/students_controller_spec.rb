require 'rails_helper'

RSpec.describe StudentsController, type: :request do
  let(:teacher) { create(:teacher) }

  before do
    sign_in teacher
  end

  describe 'DELETE /students/:id' do
    let!(:student) { create(:student) }

    before do
      delete student_path(student)
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'deletes student' do
      expect(Student.find_by(id: student.id)).to be_nil
    end
  end

  describe 'GET /students' do
    let!(:students) { create_list(:student, 3) }

    before do
      get students_path
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns students' do
      students = JSON.parse(response.body)['students']
      expect(students.length).to eq(3)
    end
  end

  describe 'POST /students' do
    let(:params) { { student: { email: 'test@test.com', password: 'password' } } }

    before do
      post students_path, params: params
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    context 'when email is taken' do
      let(:student) { create(:student) }
      let(:params) { { student: { email: student.email, password: 'password' } } }

      it 'returns 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns error message' do
        errors = JSON.parse(response.body)
        expect(errors).to include('Email has already been taken')
      end
    end

    context 'when password is too short' do
      let(:params) { { student: { email: 'test@test.com', password: 'pass' } } }

      it 'returns 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns error message' do
        errors = JSON.parse(response.body)
        expect(errors).to include('Password is too short (minimum is 6 characters)')
      end
    end
  end
end
