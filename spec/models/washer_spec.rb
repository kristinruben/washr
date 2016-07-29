require 'rails_helper'

describe Washer do
  it { should have_valid(:laundromat_id).when(2) }
  it { should_not have_valid(:laundromat_id).when(nil, '') }

  it { should have_valid(:number_available).when(8) }
  it { should_not have_valid(:number_available).when(nil, '') }
end
