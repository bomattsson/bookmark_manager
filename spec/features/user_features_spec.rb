feature 'register a new user' do
	scenario 'renders register form' do
		visit '/users/new'
		expect(status_code).to eq 200
	end

	scenario 'I can create a new user' do
      expect(User.count).to eq 0
	    visit '/users/new'
    	fill_in 'name',   with: 'Chris'
     	fill_in 'email', with: 'chris@cint.com'
     	fill_in 'password', with: '12345'
     	fill_in 'password_confirm', with: '12345'
     	click_button 'Register'
      expect(User.count).to eq 1
	end

	scenario 'new user not created with vaild input ' do
      expect(User.count).to eq 0
      visit '/users/new'
      fill_in 'name', with: ''
      fill_in 'email', with: 'chris@cint.com'
      fill_in 'password', with: 'anything'
      fill_in 'password_confirm', with: 'anything'
      click_button 'Register'
      expect(User.count).to eq 0
  end 

    scenario 'logs in new user with valid credentials ' do
      User.create(name: 'bo', email: 'bo@cint.com', password: 'password', password_confirm: 'password')
      visit '/users/signin'
      fill_in 'email', with: 'bo@cint.com'
      fill_in 'password', with: 'password'
      click_button 'Register'
      expect(page.current_path).to eq '/'
      expect(page).to have_content "Welcome bo@cint,com"
  end 

end