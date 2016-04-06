class AddColToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :students_count, :integer
    add_column :schools, :teachers_count, :integer
    add_column :teachers, :students_count, :integer
  end
end
