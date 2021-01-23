class AddStatusToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :status, :integer
  end
end
