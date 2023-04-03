class AddGradeColumnToSubmissions < ActiveRecord::Migration[7.0]
  def up
    add_column :submissions, :grade, :decimal
  end

  def down
    remove_column :submissions, :grade
  end
end
