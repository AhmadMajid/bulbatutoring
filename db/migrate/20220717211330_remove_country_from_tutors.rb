class RemoveCountryFromTutors < ActiveRecord::Migration[7.0]
  def change
    remove_column :tutors, :country
  end
end
