class CreateShow < ActiveRecord::Migration[5.0]
  def change
    create_table :shows do |t|
      t.string :user
      t.string :movie
    end
  end
end
