class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :laboratory_class, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
