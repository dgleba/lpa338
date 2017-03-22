class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.integer :sort
      t.integer :active_status

      t.timestamps null: false
    end
  end
end
