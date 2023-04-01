require 'rails_helper'

RSpec.describe StudentsController, type: :request do
  before do
    sign_in teacher
  end

  describe 'POST /student' do
    let(:teacher) { create(:teacher) }
    let(:params) { { student: { email: 'test@test.com', password: 'password' } } }

    before do
      post '/student', params: params
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
