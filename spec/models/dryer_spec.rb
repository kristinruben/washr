require 'rails_helper'

describe Dryer do
<<<<<<< HEAD
=======

>>>>>>> master
  it { should have_valid(:laundromat_id).when(2) }
  it { should_not have_valid(:laundromat_id).when(nil, '') }

  it { should have_valid(:in_service).when(true) }
  it { should_not have_valid(:in_service).when(nil, '') }

  it { should have_valid(:time_remaining).when(8) }
  it { should_not have_valid(:time_remaining).when(nil, '') }
end
