class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :review_type, optional: true
  belongs_to :tv_show

  enum status: [:accepted, :cancelled, :denied]
end
