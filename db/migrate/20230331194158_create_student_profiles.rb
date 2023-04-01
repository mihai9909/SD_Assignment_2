class CreateStudentProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :student_profiles do |t|
      t.string :full_name
      t.string :group
      t.string :hobby
      t.string :token_digest
      t.integer :student_id
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
