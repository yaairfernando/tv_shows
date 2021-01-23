class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :description
      t.references :user, null: true, foreign_key: true
      t.references :review_type, null: true, foreign_key: true
      t.references :tv_show, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
