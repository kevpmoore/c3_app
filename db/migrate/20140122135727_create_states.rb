class CreateStates < ActiveRecord::Migration
  def up
    create_table :states do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    State.delete_all
  end
end
