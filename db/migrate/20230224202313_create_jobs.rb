class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :company
      t.references :user, null: false, foreign_key: true
      t.string :role
      t.string :level
      t.string :description
      t.integer :status
      t.string :type
      t.integer :salary
      t.string :application_link

      t.timestamps
    end
  end
end
