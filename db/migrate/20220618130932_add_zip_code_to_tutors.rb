class AddZipCodeToTutors < ActiveRecord::Migration[7.0]
  def change
    add_column :tutors, :zip_code, :string
  end
end
