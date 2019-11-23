require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'User validation' do 
	  context 'Password' do 
		it 'should check for short password' do 
			user =  User.new(email:'adama@gmail.com', password:'12345')  
			expect(user.valid?).to be_falsy
		end
		it 'should check for empty password' do 
			user =  User.new(email:'adama@gmail.com', password:'')  
			expect(user.valid?).to be_falsy
		end
		it 'should check for valid password' do 
			user =  User.new(email:'adama@gmail.com', password:'123456')  
			expect(user.valid?).to be_truthy
		end
	  end
	  context 'Email' do 
		it 'should check for invalid email' do 
			user =  User.new(email:'adamagmail.com', password:'123456')  
			expect(user.valid?).to be_falsy
		end
		it 'should check for email uniqueness' do 
			user =  FactoryBot.create(:user,email:'adama@gmail.com', password:'123456')  
			user2 =  User.new(email:'adama@gmail.com', password:'123456')  
			expect(user2.valid?).to be_falsy
		end
		it 'should check for valid email' do 
			user =  User.new(email:'adama@gmail.com', password:'123456')  
			expect(user.valid?).to be_truthy
		end
	  end
	end
	describe 'User association' do
	  it 'attendances association' do 
	      user_attendances= User.reflect_on_association(:attendances)
	      expect(user_attendances.macro).to eq(:has_many) 
	  end
	 it 'attended_events association' do 
       user_attended_events = User.reflect_on_association(:attended_events)
       expect(user_attended_events.macro).to eq(:has_many) 
    end
     it 'sent_invitations association' do 
       user_sent_invitations = User.reflect_on_association(:sent_invitations)
       expect(user_sent_invitations.macro).to eq(:has_many) 
    end
    it 'received_invitations association' do 
       user_received_invitations = User.reflect_on_association(:received_invitations)
       expect(user_received_invitations.macro).to eq(:has_many) 
    end
   end

end