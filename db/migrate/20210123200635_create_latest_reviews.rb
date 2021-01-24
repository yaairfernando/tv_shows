class CreateLatestReviews < ActiveRecord::Migration[6.1]
  def change
    create_view :latest_reviews
  end
end
