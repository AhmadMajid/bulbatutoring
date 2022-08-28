class AddUniqueIndexToReservations < ActiveRecord::Migration[7.0]
  def change
    add_index :reservations, [:tutor_id, :user_id, :reservation_date], unique: true, name: "idx_reserv_on_tutor_id_and_user_id_and_reserv_date"
  end
end
