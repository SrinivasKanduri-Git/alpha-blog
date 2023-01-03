class User < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD

=======
=======
  has_many :articles
>>>>>>> adding_users
  validates :username,
   presence: true, uniqueness: { case_sensitive: false },
   length: { minimum: 8, maximum: 25 }
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
   presence: true, uniqueness: { case_sensitive: false },
   length: { maximum: 105 },
<<<<<<< HEAD
   format: {with: VALID_EMAIL_REGEX} 
>>>>>>> adding_users
=======
   format: {with: VALID_EMAIL_REGEX}
>>>>>>> adding_users
end
