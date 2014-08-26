class User < ActiveRecord::Base
  has_secure_password
  validate :password, presence: true

  has_many :cars

  def owns?(car)
    self.cars.include?(car)
  end
end
