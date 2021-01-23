class CreateTvShows < ActiveRecord::Migration[6.1]
  def change
    create_table :tv_shows do |t|
      t.string :name
      t.string :show_type

      t.timestamps
    end
  end
end
