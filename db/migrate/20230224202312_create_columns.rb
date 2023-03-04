class CreateColumns < ActiveRecord::Migration[7.0]
  def change
    create_table :columns do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :position
      t.timestamps
    end
  end
end
