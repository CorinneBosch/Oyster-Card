require "station"

describe Station do
  let(:station) { Station.new(:name, :zone) }

  it 'is an instance of Station' do
    expect(station).to be_instance_of Station
  end

  it 'has a name by creation' do
    expect(station.name).to eq(:name)
  end 

  it 'has a zone by creation' do
<<<<<<< HEAD
    subject = Station.new(:name, 1)
    expect(subject.zone).to eq(1)
=======
    expect(station.zone).to eq(:zone)
>>>>>>> 4c7c9e13fad94d6a5f99e15b4580e30c6fe716a9
  end

end