class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :Name
      t.float :Height
      t.float :Weight
      t.float :GPA
      t.string :Color

      t.timestamps null: false
    end
  end
end
