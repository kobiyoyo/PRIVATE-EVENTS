require 'rails_helper'
feature 'Signup' do 

	
	scenario 'Signup' do
		user =  User.new(email:'dasn@gmail.com',password:'5244sdrwrfsdf',password_confirmation:'5244sdrwrfsdf')
	
		visit(signup_path)
	    fill_in 'Email',with: user.email
	    fill_in 'Password',with: user.password
	    fill_in 'Confirmation',with: user.password_confirmation
	    click_button('Create User')
	    expect(page).to have_css(".alert-success")
	end
	scenario 'Signup' do
		user =  User.new(email:'dasn@gmail.com',password:'5244sdrwrfsdf',password_confirmation:'5244sdrwrfsdf')
		
		visit(signup_path)
	    fill_in 'Email',with: ''
	    fill_in 'Password',with: user.password
	    fill_in 'Confirmation',with: user.password_confirmation
	    click_button('Create User')
	    expect(page).to have_css(".alert-danger")
	end
	scenario 'Signup' do
		user =  User.new(email:'dasn@gmail.com',password:'5244sdrwrfsdf',password_confirmation:'5244sdrwrfsdf')
	
		visit(signup_path)
	    fill_in 'Email',with: user.email
	    fill_in 'Password',with: ''
	    fill_in 'Confirmation',with: user.password_confirmation
	    click_button('Create User')
	    expect(page).to have_css(".alert-danger")
	end
	scenario 'Signup' do
		user =  User.new(email:'dasn@gmail.com',password:'5244sdrwrfsdf',password_confirmation:'5244sdrwrfsdf')
	
		visit(signup_path)
	    fill_in 'Email',with: user.email
	    fill_in 'Password',with: user.password
	    fill_in 'Confirmation',with: ''
	    click_button('Create User')
	    expect(page).to have_css(".alert-danger")
	end
end