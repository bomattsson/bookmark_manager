require 'link'

describe Link do
   it { is_expected.to have_property :id }
   it { is_expected.to have_property :title }
   it { is_expected.to have_property :url }
   xit { is_expected.to have_property :description }
   xit { is_expected.to have_many_and_belong_to :tags }
   it { is_expected.to validate_presence_of :title }
   it { is_expected.to validate_presence_of :url }
end
