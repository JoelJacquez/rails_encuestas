class Question < ActiveRecord::Base
  belongs_to :my_poll
  has_many :anwers
  validates :description, presence: true, length: { minimum: 10 }
  validates :my_poll, presence: true
end
