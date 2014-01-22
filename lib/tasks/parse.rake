namespace :import do

  desc "load user data from csv"
  task :load_csv_data, [:csv_file]  =>:environment do |t, args|
    require 'CSV'
    p "Loading  #{args.csv_file}"   #data1.csv
    CSV.foreach("lib/tasks/#{args.csv_file}", :headers => true) do |csv_obj|
      name =   csv_obj['Name']
      state =  csv_obj['State']
      salary = csv_obj['Salary']
      postcode = csv_obj['Postcode']
      date_of_birth = csv_obj['Date of birth']

      #puts name
      #puts state
      #puts salary
      #puts postcode
      #puts date_of_birth
      begin
        person = Person.create!(:name => name,
                      :state_id => state,
                      :salary => salary,
                      :postcode => postcode,
                      :date_of_birth => date_of_birth
        )
        p "Created #{person.name}"
      rescue => e

       if e.message =~ /Postcode(.*)/
       p "ERROR: Unable to create #{name} - #{e.message}"
       else
          person = Person.create(:date_of_birth => date_of_birth, :name => "Test", :postcode => postcode,
          :state_id => 1, :salary => 0)

          person.update_column(:name, name)
          person.update_column(:state_id, state)
          person.update_column(:salary, salary)

          p "Created #{person.name}  ( #{e.message} )"
       end
      end
    end


  end
end