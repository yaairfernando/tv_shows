class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.references :team, null: true, foreign_key: true

      t.timestamps
    end
  end
end
