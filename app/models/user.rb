class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  #  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    email: true,
                    length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
  #                    format: { with: VALID_EMAIL_REGEX },
                    
  validates :birthday_before_type_cast, allow_blank: true, 
    format: {with: /[1-2]{1}[0-9]{3}-[0-1][0-9]-[0-3][0-9]/}
  validates :registered_before_type_cast, allow_blank: true, 
    format: {with: /[1-2]{1}[0-9]{3}-[0-1][0-9]-[0-3][0-9]/}

  has_secure_password
end
