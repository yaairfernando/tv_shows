class CreateReviewTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :review_types do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
