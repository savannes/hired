class RemoveDefaultFromName < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:calendar_events, :name, nil)
  end
end
