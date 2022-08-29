class ChangeTutorsReviewsCountAverageRatingColumns < ActiveRecord::Migration[7.0]
  def change
    change_column :tutors, :reviews_count, :integer, default: 0, null: false
    change_column :tutors, :average_rating, :decimal, default: 0, null: false
  end
end
