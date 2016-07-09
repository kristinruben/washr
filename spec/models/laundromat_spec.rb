describe Laundromat do
  it { should have_valid(:name).when('a name') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:street).when('123 Street') }
  it { should_not have_valid(:street).when(nil, '') }

  it { should have_valid(:city).when('Boston') }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when('MA') }
  it { should_not have_valid(:state).when(nil, '') }

  it { should have_valid(:zip).when('02138') }
  it { should_not have_valid(:zip).when(nil, '') }

  it { should have_valid(:washers_available).when('2') }
  it { should_not have_valid(:washers_available).when(nil, '') }

  it { should have_valid(:dryers_available).when('2') }
  it { should_not have_valid(:dryers_available).when(nil, '') }

  it { should have_valid(:total_washers).when('2') }
  it { should_not have_valid(:total_washers).when(nil, '') }

  it { should have_valid(:total_dryers).when('2') }
  it { should_not have_valid(:total_dryers).when(nil, '') }

  it { should have_valid(:visitors_today).when('2') }
  it { should_not have_valid(:visitors_today).when(nil, '') }

end
