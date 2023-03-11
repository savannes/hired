class CreateCalendarEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :calendar_events do |t|
      t.string :name, null: false, default: "no name"
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :job, null: false, foreign_key: true
      t.text :description
      t.timestamps
    end
  end
end
