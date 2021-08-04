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
    expect(station.zone).to eq(:zone)
  end

end