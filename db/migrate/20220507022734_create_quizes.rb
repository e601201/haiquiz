class CreateQuizes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizes do |t|
      t.string :title
      t.text :content
      t.string :first_line
      t.string :second_line
      t.string :third_line
      t.integer :status
      t.string :answer_word
      t.timestamps
    end
  end
end
