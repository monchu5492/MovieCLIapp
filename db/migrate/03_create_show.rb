class CreateShow < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.integer :user_id
      t.integer :movie_id
      t.string :user_name
      t.string :movie_title
    end
  end
end
