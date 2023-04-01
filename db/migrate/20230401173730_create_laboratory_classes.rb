class CreateLaboratoryClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :laboratory_classes do |t|
      t.string :title
      t.integer :laboratory_number
      t.string :description
      t.string :curriculum
      t.datetime :start_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
