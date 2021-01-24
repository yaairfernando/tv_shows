class TvShow < ApplicationRecord
  has_many :reviews
  has_many :latest_reviews
end
