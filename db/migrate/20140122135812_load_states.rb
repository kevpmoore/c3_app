class LoadStates < ActiveRecord::Migration
  def change
    require 'CSV'
    CSV.foreach("lib/tasks/states.csv") do |row|
      p row
      state = State.create!(:id => row[0].to_i,
                    :name => row[1]
      )
    end
  end
end
