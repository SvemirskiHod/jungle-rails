require 'rails_helper'
require 'byebug'
RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new(first_name: "Captain",
                     last_name: "Underpants",
                     email: "cap@cap.com",
                     password: "undies",
                     password_confirmation: "undies")
  end

  it "should save user into DB" do
    expect(@user.save).to be(true)
  end

  it "should not save user into DB if password and password_confirmation do not match" do
    @user.password_confirmation = "not the same"
    expect(@user.save).to be(false)
  end

  it "should not save user if password and password confirmation are not fields" do
    userNew = User.new(first_name: "Ted", last_name: "Baker", email: "ted@b.com")
    expect(userNew.save).to be(false)
  end

  it "should not save duplicate emails to database" do
    userSameEmail = User.new(first_name: "Coop",
                     last_name: "Underhoops",
                     email: "cap@cap.com",
                     password: "undies",
                     password_confirmation: "undies"
                     ).save
   expect(@user.save).to be(false)
  end

  it "should not save duplicate emails to database (uppercased email)" do
      userSameEmail = User.new(first_name: "Coop",
                       last_name: "Underhoops",
                       email: "CAP@CAP.com",
                       password: "undies",
                       password_confirmation: "undies"
                       ).save
   expect(@user.save).to be(false)
  end

  it "should not save user if email does not exist" do
    @user.email = nil
    expect(@user.save).to be(false)
  end

  it "should not save user if first_name does not exist" do
    @user.first_name = nil
    expect(@user.save).to be(false)
  end

  it "should not save user if last_name does not exist" do
    @user.last_name = nil
    expect(@user.save).to be(false)
  end

  it "should not save if the password length is less than six" do
    @user.password = "12345"
    @user.password_confirmation = "12345"
    expect(@user.save).to be(false)
  end


end


