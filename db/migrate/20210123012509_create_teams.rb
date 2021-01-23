class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :group, null: true, foreign_key: true
      t.string :color
      t.string :description

      t.timestamps
    end
  end
end
