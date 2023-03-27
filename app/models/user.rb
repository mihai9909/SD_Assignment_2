class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  before_save :digest_password
  before_save :downcase_email

  private
  def digest_password
    self.password_digest = Digest::MD5::hexdigest(self.password_digest)
  end

  def valid_password?(password)
    self.password_digest == Digest::MD5::hexdigest(password)
  end

  def downcase_email
    self.email = self.email.downcase
  end
end
