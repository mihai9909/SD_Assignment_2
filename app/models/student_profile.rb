class StudentProfile < ApplicationRecord
  attr_accessor :token

  belongs_to :student, optional: false

  before_save :generate_token_digest!, if: -> { token.present? }

  def generate_token!
    self.token = SecureRandom.hex(128)
  end

  def valid_token?(token)
    self.token_digest == Digest::SHA256.hexdigest(token)
  end

  private
  def generate_token_digest!
    self.token_digest = Digest::SHA256.hexdigest(token)
  end
end
