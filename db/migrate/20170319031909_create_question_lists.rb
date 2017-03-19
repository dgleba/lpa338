class CreateQuestionLists < ActiveRecord::Migration
  def change
    create_table :question_lists do |t|
      t.string :name
      t.integer :sort
      t.integer :active_status

      t.timestamps null: false
    end
  end
end
