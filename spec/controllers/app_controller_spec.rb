describe 'Root Path' do
  describe 'GET /' do
    before { get '/' }
    it 'is successful' do
      expect(last_response.status).to eq 200
    end
  end
end

describe 'Tag Path' do
  describe 'GET /tags' do
    before { get '/links' }
    it 'is successful' do
      expect(last_response.status).to eq 200
    end
  end
 end
