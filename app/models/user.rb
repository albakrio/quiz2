class User < ApplicationRecord
    has_secure_password
    has_many :ideas, dependent: :nullify
    has_many :reviews, dependent: :nullify
    has_many :likes, dependent: :destroy
    has_many :liked_questions, through: :likes, source: :idea


    validates :email, presence: true, uniqueness: true,
              format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
end
