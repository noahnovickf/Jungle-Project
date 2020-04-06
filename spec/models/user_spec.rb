require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'password and password confirmation are equal' do
      user = User.create(name: "abc", email: 'nn@.gmail.com', password: "123", password_confirmation: '123')
       expect(user).to be_valid
    end
    it `password and password confirmation aren't equal, user not valid` do
      user = User.create(name: "abc", email: 'nn@.gmail.com', password: "123", password_confirmation: '1234')
       expect(user).to_not be_valid
    end
    it 'no two emails are the same' do
      user = User.create(name: "abc", email: 'nn@.gmail.com', password: "123", password_confirmation: '123')
      user2 = User.create(name: "fff", email: 'NN@.gmail.com', password: "123", password_confirmation: '123')
      expect(user2).to_not be_valid
    end
    it 'name should be present' do
      user = User.create(name: nil, email: 'nn@.gmail.com', password: "123", password_confirmation: '123')
      expect(user).to_not be_valid
    end 
    it 'email should be present' do
      user = User.create(name: 'hi', email: nil, password: "123", password_confirmation: '123')
      expect(user).to_not be_valid
    end 
    it 'password should be greater than 3 characters' do
      user = User.create(name: 'hi', email: nil, password: "13", password_confirmation: '13')
      expect(user).to_not be_valid
    end
  end
  
  describe '.authenticate_with_credentials' do
    it 'login valid user' do 
      user = User.create(name: 'hi', email: 'n@n.com', password: "1345", password_confirmation: '1345')
      userA = User.authenticate_with_credentials(user.email, user.password)
      expect(userA).to be true
    end
    
    it 'login valid user with spaces in email' do 
      user = User.create(name: 'hi', email: 'n@n.com', password: "1345", password_confirmation: '1345')
      userA = User.authenticate_with_credentials(' n@n.com ', user.password)
      expect(userA).to be true
    end
    it 'login valid user with bad casing in email' do 
      user = User.create(name: 'hi', email: 'n@n.com', password: "1345", password_confirmation: '1345')
      userA = User.authenticate_with_credentials('N@n.com', user.password)
      expect(userA).to be true
    end

  end
end
