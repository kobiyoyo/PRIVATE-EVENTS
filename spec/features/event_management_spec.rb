require 'rails_helper'
feature 'event' do
let(:user){ FactoryBot.create(:user) } 
let(:event){ FactoryBot.create(:event) } 
background do 
	visit(login_path)
	fill_in 'Email',with: user.email
	fill_in 'Password',with: user.password
end


  scenario 'have Past events index' do
    visit events_path
    expect(page).to have_content('Past Events')
  end

  scenario 'have upcoming events index' do
    visit events_path
    expect(page).to have_content('Upcoming Events')
  end


end