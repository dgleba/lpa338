class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body
      t.references :choice, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.references :response, index: true, foreign_key: true
      t.string :issue
      t.text :action

      t.timestamps null: false
    end
  end
end
