class AddAverageRatingToTutors < ActiveRecord::Migration[7.0]
  def change
    add_column :tutors, :average_rating, :decimal
  end
end
