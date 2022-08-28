class AddReviewsCountToTutors < ActiveRecord::Migration[7.0]
  def change
    add_column :tutors, :reviews_count, :integer
  end
end
