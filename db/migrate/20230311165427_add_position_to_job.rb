class AddPositionToJob < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :position, :integer
  end
end
