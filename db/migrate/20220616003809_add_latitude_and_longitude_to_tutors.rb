class AddLatitudeAndLongitudeToTutors < ActiveRecord::Migration[7.0]
  def change
    add_column :tutors, :latitude, :float
    add_column :tutors, :longitude, :float
  end
end
