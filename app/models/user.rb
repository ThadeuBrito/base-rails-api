require 'bcrypt'
require 'digest/sha1'

class User < ActiveRecord::Base

  before_create :update_access_token!

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  def password=(new_password)
    @password = new_password
    self.encrypted_password = BCrypt::Password.create(@password)
  end

  def password
    @password
  end

  def valid_password?(password_to_validate)
    BCrypt::Password.new(encrypted_password) == password_to_validate
  end

  private
  def update_access_token!
    self.access_token = Digest::SHA1.hexdigest("--#{rand(10000)}--#{Time.now}--")[0,40]
  end

end
