class User < ApplicationRecord
  belongs_to :team, optional: true
  has_many :reviews

  enum status: [:active, :suspended, :blocked]
end
