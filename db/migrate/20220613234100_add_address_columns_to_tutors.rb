class AddAddressColumnsToTutors < ActiveRecord::Migration[7.0]
  def change
    add_column :tutors, :address_1, :string
    add_column :tutors, :address_2, :string
  end
end
