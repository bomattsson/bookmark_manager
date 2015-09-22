require 'user'

describe User do
   it { is_expected.to have_property :id }
   it { is_expected.to have_property :email }
   it { is_expected.to have_property :password_digest }
   
   it { is_expected.to validate_format_of(:email).with(:email_address) }
   it { is_expected.to validate_uniqueness_of :email }
   
   
   it { is_expected.to have_many :links }
   
   it { is_expected.to validate_presence_of :email }
   it { is_expected.to validate_presence_of :password }
   
   describe 'password encryption' do
     it 'encrypts password' do
       
     end
   end
   
   describe 'user authentication' do
     before { @user = User.create(email: 'thomas@makersacademy.se', password: 'password', password_confirmation: 'password')
}
     it 'with valid credentials' do
       expect(User.authenticate('thomas@makersacademy.se', 'password')).to eq @user
     end
     
     it 'with invalid credentials' do
       expect(User.authenticate('thomas@makersacademy.se', 'wrong-password')).to eq nil
     end
   end
  
end