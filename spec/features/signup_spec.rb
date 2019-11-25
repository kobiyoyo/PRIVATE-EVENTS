require 'rails_helper'
feature 'Signup' do 

	
	scenario 'Signup' do
		user =  User.new(email:'weqasn@gmail.com')
	
		visit(signup_path)
	    fill_in 'Email',with: user.email
	    click_button('Create User')
	    expect(page).to have_content("You have signed up.")
	end
	scenario 'Signup with empty email' do
		user =  User.new(email:'dasn@gmail.com')
		
		visit(signup_path)
	    fill_in 'Email',with: ''
	    click_button('Create User')
	    expect(page).to have_css(".alert-danger")
	end
end