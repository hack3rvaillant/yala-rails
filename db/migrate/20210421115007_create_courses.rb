class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.references :author, null: false, foreign_key: {to_table: :users}
      t.references :community, null: false, foreign_key: true

      t.timestamps
    end
  end
end
