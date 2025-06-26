class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 5 }
  validates :author, presence: true, length: { minimum: 3, maximum: 20 }
end
