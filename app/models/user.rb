require 'bcrypt'

class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    has_one :spending
    has_many :income
    has_many :expenses
    include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
