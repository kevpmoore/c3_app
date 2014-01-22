require 'spec_helper'

describe Person do

  it "can be saved successfully" do
    create(:person).should be_persisted
  end

  it "is not valid if name is less than 4 characters" do
    person = build :person, name:"Tom"
    person.should_not be_valid
  end

  it "is not valid if the salary is a float" do
    person = build :person, salary:9900.50
    person.should_not be_valid
  end

  it "is not valid without a postcode" do
    person = build :person, postcode:nil
    person.should_not be_valid
  end

  it "is not valid if the state does not exist" do
    person = build :person, state_id:0
    person.should_not be_valid
  end
end
