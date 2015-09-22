require 'tag'

describe Tag do
   it { is_expected.to have_property :id }
   it { is_expected.to have_property :title }
   
   it { is_expected.to have_many_and_belong_to :links }
   
   it { is_expected.to validate_presence_of :title }
end