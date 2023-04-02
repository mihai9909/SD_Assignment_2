class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.datetime :deadline
      t.string :description
      t.references :laboratory_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
