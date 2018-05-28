class Note < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
  
  scope :new_order, -> { order(created_at: :desc) }
  
  paginates_per 3
end
