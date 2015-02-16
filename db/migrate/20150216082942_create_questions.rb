class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content, null: false
      t.integer :hits, default: 1
      t.timestamps
    end
  end
end
