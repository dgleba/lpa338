class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.integer :qtype
      t.references :survey, index: true, foreign_key: true
      t.integer :sort
      t.integer :active_status

      t.timestamps null: false
    end
  end
end
