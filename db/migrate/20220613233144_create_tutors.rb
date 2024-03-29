class CreateTutors < ActiveRecord::Migration[7.0]
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :headline
      t.text :description
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
