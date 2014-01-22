class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :state_id
      t.integer :salary
      t.date :date_of_birth
      t.integer :postcode

      t.timestamps
    end
  end
end
