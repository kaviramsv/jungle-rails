require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do 

    it ("should create and save a new user if all validations are met") do
      @user = User.create( first_name:"kv" ,last_name: "ram", email: "Example@example.com", password: "apple234", password_confirmation: "apple234")
      expect(@user).to be_valid     
    end
  
    it ("should not save if password and password_confirm fields doesnt match") do
      @user = User.create( first_name:"kv" ,last_name: "ram", email: "Example@example.com", password: "apple234", password_confirmation: "apple23")
      expect(@user).to_not be_valid     
    end
    it ("should not save if email already exists in the database and is not case sensitive ") do
      @user1 = User.create( first_name:"kv" ,last_name: "ram", email: "Example@example1.com", password: "apple234", password_confirmation: "apple23")
      @user2 = User.create( first_name:"kv" ,last_name: "ram", email: "example@example2.com", password: "apple234", password_confirmation: "apple23")
      @user2.save
      expect(@user2).to_not be_valid     
    end
    it ("should create and save a new user if all validations are met") do   
      @user = User.create( first_name:"kv" ,last_name: "ram", email: "Example@example.com", password: "apple234", password_confirmation: "apple234")
      @user.save
      expect(@user).to be_valid    
    end
    it ("should have a password length greater than 7 characters") do
      @user = User.create( first_name:"kv" ,last_name: "ram", email: "Example@example.com", password: "apple", password_confirmation: "apple234")
      @user.valid?   
      expect(@user).not_to be_valid
    end
  end
  describe '.authenticate_with_credentials' do  
   
    it ("should not be case sensitive for email.") do
      @user = User.new(first_name: "Kv", last_name: "Ram", email: "abc@sample.com", password: "Apple123", password_confirmation: "Apple123")
      @user.save
      puts @user.email
      @authenticated_user = User.authenticate_with_credentials("Abc@sample.com", "Apple123")
      puts @authenticated_user
      expect(@authenticated_user).to eq(@user)
    end

    it ("should trim extra spaces in email.") do
      @user = User.new(first_name: "Kv", last_name: "Ram", email: "abcd@sample.com", password: "Apple123", password_confirmation: "Apple123")
      @user.save
      puts @user.email
      @authenticated_user = User.authenticate_with_credentials(" Abcd@sample.com ", "Apple123")
      puts @authenticated_user
      expect(@authenticated_user).to eq(@user)
    end
  end
  

end
