require 'user'

describe User do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :name }
  it { is_expected.to have_property :email }
  it { is_expected.to have_property :password_digest }

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_format_of(:email).with(:email_address) }
  it { is_expected.to validate_uniqueness_of :email }

  # it { is_expected.to have_many :links }

  #it { is_expected.to validate_presence_of :password }

  describe 'password encryption' do
      it 'encrypts password' do
      user = user.create(email: 'bo@cint.com', password: 'test', password_confirm: '')
      expect(user.password_digest.class).to eq BCrypt::password
      expect(user.password_digest.version).to eq "whatever"
      end
  end

  describe 'user authentication' do

    before do
      @user = User.create(name: 'chris', email: 'chris@cint.com', password: 'password', password_confirm: 'password')
    end

    it 'with valid credentials' do
      expect(User.authenticate('chris@cint.com', 'password')).to eq @user
    end

    xit 'with invalid credentials' do
      expect(User.authenticate('chris@cint.com', 'wrong-password')).to eq nil
    end
  end

end
