class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.belongs_to :workout, foreign_key: true
      t.timestamps
    end
  end

end
