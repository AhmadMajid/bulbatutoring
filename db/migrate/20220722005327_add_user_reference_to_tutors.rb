
class AddUserReferenceToTutors < ActiveRecord::Migration[7.0]
  def change
    add_reference :tutors, :user, null: true, foreign_key: true
    Tutor.update_all(user_id: User.first.id)
  end
end
