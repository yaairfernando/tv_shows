class AddStatusToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :status, :integer
    add_column :reviews, :scheduled_date, :datetime
    add_column :reviews, :votes, :integer
    add_column :reviews, :revenue, :integer
  end
end
