class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :name
      t.references :survey, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :ip

      t.timestamps null: false
    end
  end
end
