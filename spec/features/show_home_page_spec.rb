require 'rails_helper'
feature 'home-page' do 
	scenario 'title' do
		visit(root_path)
		expect(page).to have_content('Event App')
	end
end