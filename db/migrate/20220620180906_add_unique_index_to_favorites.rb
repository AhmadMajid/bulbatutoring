class AddUniqueIndexToFavorites < ActiveRecord::Migration[7.0]
  def change
    add_index :favorites, [:tutor_id, :user_id], unique: true
  end
end
