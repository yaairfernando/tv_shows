class Team < ApplicationRecord
  belongs_to :group, optional: true
  has_many :users

  enum status: [:active, :suspended, :deprecated]
end
