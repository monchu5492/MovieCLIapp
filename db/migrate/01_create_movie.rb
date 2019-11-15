class CreateMovie < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :rated
      t.string :genre
    end
  end
end
