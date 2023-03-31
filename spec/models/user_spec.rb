require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let!(:user) { create(:user, email: 'test@test.com', password_digest: '123456') }
    let(:test_user) { User.new(email: nil, password_digest: nil) }

    before do
      test_user.valid?
    end

    it 'validates presence of email' do
      expect(test_user.errors[:email]).to include("can't be blank")
    end

    it 'validates uniqueness of email' do
      invalid_user = User.new(email: 'test@test.com')
      invalid_user.valid?
      expect(invalid_user.errors[:email]).to include('has already been taken')
    end

    it 'validates presence of password_digest' do
      expect(test_user.errors[:password_digest]).to include("can't be blank")
    end

    it 'encrypts password_digest' do
      expect(Digest::MD5::hexdigest('123456')).to eq(user.password_digest)
    end
  end
end
