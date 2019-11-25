require 'rails_helper'
feature 'Signin' do 
  
	let(:user){ FactoryBot.create(:user) } 
	scenario 'title' do
		visit(login_path)
	    fill_in 'Email',with: user.email
	    click_on('Login')
	    expect(page).to have_content("Logged in.")
	end
	scenario 'title' do
		visit(login_path)
	    fill_in 'Email',with:''
	    click_on('Login')
	    expect(page).to have_content("Invalid email/password combination.")
	end

end