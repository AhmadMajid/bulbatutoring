class AddCountryCodeToTutors < ActiveRecord::Migration[7.0]
  def change
    add_column :tutors, :country_code, :string
  end
end
