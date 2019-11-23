require 'rails_helper'

RSpec.describe Event, type: :model do
	describe 'Event validation' do 
		let(:event) { FactoryBot.create(:event,title:'hello good',
								description:'q' * 24,
								start_time:'2019-12-31 15:15:00',
								location:'abuja'
								)  }
		it 'should check for valid event' do 
			expect(event.valid?).to be_truthy
		end
		it 'should check for short title' do 
			event.title = "cool"
			expect(event.valid?).to be_falsy
		end
		it 'should check for short description' do 
			event.description = "cool"
			expect(event.valid?).to be_falsy
		end
		it 'should check for short date' do 
			event.start_time = ""
			expect(event.valid?).to be_falsy
		end
		it 'should check for valid location' do 
			event.location = ""
			expect(event.valid?).to be_falsy
		end
		
	end
	describe 'Event association' do
	  it 'creator association' do 
	      event_creator = Event.reflect_on_association(:creator)
	      expect(event_creator.macro).to eq(:belongs_to) 
	  end
	 it 'attendances association' do 
       event_attendances = Event.reflect_on_association(:attendances)
       expect(event_attendances.macro).to eq(:has_many) 
    end
     it 'attendees association' do 
       event_attendees = Event.reflect_on_association(:attendees)
       expect(event_attendees.macro).to eq(:has_many) 
    end
    it 'invitations association' do 
       event_invitations = Event.reflect_on_association(:invitations)
       expect(event_invitations.macro).to eq(:has_many) 
    end
   end

end