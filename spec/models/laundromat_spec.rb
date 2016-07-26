require 'rails_helper'

describe Laundromat do
  it { should have_valid(:name).when('a name') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:address).when('123 Street') }
  it { should_not have_valid(:address).when(nil, '') }

  it { should have_valid(:city).when('Boston') }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when('MA') }
  it { should_not have_valid(:state).when(nil, '') }

  it { should have_valid(:zip_code).when('02138') }
  it { should_not have_valid(:zip_code).when(nil, '') }

  # it { should have_valid(:washers).when(2) }
  # it { should_not have_valid(:washers).when(nil, '') }
  #
  # it { should have_valid(:dryers).when(2) }
  # it { should_not have_valid(:dryers).when(nil, '') }
end
