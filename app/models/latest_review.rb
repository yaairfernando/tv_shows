class LatestReview < ApplicationRecord
  self.primary_key = :id
  belongs_to :tv_show

  def readonly?
    true
  end
end