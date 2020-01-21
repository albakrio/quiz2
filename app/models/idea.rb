class Idea < ApplicationRecord
    validates(:title, presence: true, uniqueness: true)
    validates(:body, presence: true, length: {minimum: 50})
    has_many :likes, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :likers, through: :likes, source: :user
    belongs_to :user
end
