require "station"

describe Station do
  let(:station) { Station.new(:name, :zone) }

  it 'is an instance of Station' do
    expect(station).to be_instance_of Station
  end

  it 'has a name by creation' do
    subject = Station.new('Soho', :zone)
    expect(subject.name).to eq('Soho')
  end 

  it 'has a zone by creation' do
    subject = Station.new(name, 1)
    expect(subject.zone).to eq(1)
  end

end