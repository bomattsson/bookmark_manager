require './lib/link.rb'

describe Link do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :title }
  it { is_expected.to have_property :url }
  it { is_expected.to have_property :desc }
  it { is_expected.to have_property :created_at }
end
