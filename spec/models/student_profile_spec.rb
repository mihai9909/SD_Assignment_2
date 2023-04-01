require 'rails_helper'

RSpec.describe StudentProfile, type: :model do
  let!(:student_profile) { build(:student_profile, student: student) }
  let!(:student) { build(:student) }

  describe 'validations' do
    it 'validates presence of student' do
      expect(build(:student_profile, student: nil)).to_not be_valid
    end
  end

  describe 'callbacks' do
    it 'encrypts the token' do
      expect(student_profile.token_digest).not_to eq(student_profile.token)
    end
  end

  describe '#generate_token!' do
    before do
      student_profile.generate_token!
    end

    it 'generates a unique token' do
      expect(student_profile.token).to be_present
    end
  end

  describe '#valid_token?' do
    before do
      student_profile.save
    end

    it 'returns true if the token is valid' do
      expect(student_profile.valid_token?(student_profile.token)).to be_truthy
    end

    it 'returns false if the token is invalid' do
      expect(student_profile.valid_token?('invalid_token')).to be_falsey
    end
  end
end
