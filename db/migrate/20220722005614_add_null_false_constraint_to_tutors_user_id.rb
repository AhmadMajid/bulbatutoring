class AddNullFalseConstraintToTutorsUserId < ActiveRecord::Migration[7.0]
  def change
    change_column :tutors, :user_id, :bigint, null: false
  end
end
