feature 'register a new user' do 
	scenario 'renders register form' do
		visit '/users/new'
		expect(status_code).to eq 200
	end

	scenario 'I can create a new user' do
	    visit '/users/new'
    	fill_in 'name',   with: 'Chris'
     	fill_in 'email', with: 'chris@cint.com'
     	fill_in 'password', with: '12345'
     	fill_in 'pawword_confirm', with: '12345'
     	click_button 'Register'

	end

end