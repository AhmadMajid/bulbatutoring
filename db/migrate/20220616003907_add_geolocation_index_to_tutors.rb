class AddGeolocationIndexToTutors < ActiveRecord::Migration[7.0]
  def change
    add_index :tutors, [:latitude, :longitude]
  end
end
