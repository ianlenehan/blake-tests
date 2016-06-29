class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :title
      t.string :name_last
      t.timestamps null: false
    end
  end
end
