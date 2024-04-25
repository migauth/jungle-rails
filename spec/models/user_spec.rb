require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "validates presence of password" do
      user = User.new(password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    
    it "validates presence of password_confirmation" do
      user = User.new(password: "password", password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end
    
    it "validates password and password_confirmation match" do
      user = User.new(password: "password", password_confirmation: "notmatching")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    
    it "validates presence of email" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    
    it "validates presence of first name" do
      user = User.new(first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    
    it "validates presence of last name" do
      user = User.new(last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    
    it "validates uniqueness of email (case insensitive)" do
      User.create(email: "example@test.com") # Create a user in the database
      user = User.new(email: "EXAMPLE@TEST.COM")
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end

    it "validates the minimum length of password" do
      user = User.new(password: "short", password_confirmation: "short")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
    end
  end
end
