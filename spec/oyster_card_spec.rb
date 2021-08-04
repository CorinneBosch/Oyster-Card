require 'oyster_card'
require 'station'

describe OysterCard do

  let(:station) { Station.new }

  let(:card) { Card.new(init balbla)} { argument}
  describe "@balance" do
    it "should have a default balance" do
      expect(subject.balance).to eq(DEFAULT_BALANCE)
    end
  end



  describe '@journeys' do
    it 'should be empty when and Oyster Card is initialised' do
      expect(subject.journeys.empty?).to be(true)
    end

    it 'should create one journey after succesfully touching in and out' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(station, 5)
      expect(subject.journeys.last).to eq({:start => station, :finish => station})
    end
  end

  describe "#top_up" do
    it "should top up by given argument" do
      opening_balance = subject.balance
      subject.top_up(10)
      expect(subject.balance).to eq(opening_balance + 10)
    end

    it 'should raise error when balance reached limit' do 
      error = "the top_up limit is #{TOP_UP_LIMIT}"
      expect { subject.top_up(91) }.to raise_error error
    end
  end

  describe "#in_journey?" do
    it "should use entry_station attribute" do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq(true)
    end

    it "should use entry_station attribute" do
      subject.top_up(5)
      subject.touch_in(station)
      subject.touch_out(station, 1)
      expect(subject.in_journey?).to eq(false)
    end
  end

  describe "#touch_in" do
    it "should raise error if you're balance < #{MINIMUM_REQUIRED}" do
      expect { subject.touch_in(station) }.to raise_error "You must top_up"
    end

    it "should record last station" do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.journeys.last[:start]).to eq(station)
    end

    it "should record entry_station" do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.entry_station).to eq(station)
    end

    it "should only only accept stations as arguments" do
      subject.top_up(10)
      expect { subject.touch_in('airport') }.to raise_error "This is not a station"
    end
  end

  describe "#touch_out" do
    it "should make entry_station attribute to nil" do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(station, 5)
      expect(subject.entry_station).to eq(nil)
    end

    it 'should record exit station in journeys' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(station, 5)
      expect(subject.exit_station).to eq(station)
    end

    it "should reduce balance by fare of journey" do
      subject.top_up(10)
      subject.touch_in(station)
      expect { subject.touch_out(station, 5) }.to change{ subject.balance }.by(-5)
    end
  end
end


