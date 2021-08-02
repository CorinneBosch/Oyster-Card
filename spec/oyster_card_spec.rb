require "oyster_card"
require "station"

describe OysterCard do

  let(:station) { Station.new }
  describe "balance attribute" do
    it "should have a default balance" do
      expect(subject.balance).to eq(DEFAULT_BALANCE)
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
    it "should return in_use attribute" do
      expect(subject.in_journey?).to eq(subject.in_use)
    end

    it "should return in_use attribute" do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq(subject.in_use)
    end
  end

  describe "#touch_in" do
    it "should change in_use attribute to true" do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq(true)
    end

    it "should raise error if you're balance < #{MINIMUM_REQUIRED}" do
      expect { subject.touch_in(station) }.to raise_error "You must top_up"
    end

    it "should record touch_in station" do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.journeys.last).to eq(station)
    end

    it "should only only accept stations as arguments" do
      subject.top_up(10)
      expect { subject.touch_in('airport') }.to raise_error "This is not a station"
    end
  end

  describe "#touch_out" do
    it "should change in_use attribute to false" do
      subject.touch_out(5)
      expect(subject.in_journey?).to eq(false)
    end

    it "should reduce balance by fare of journey" do
      subject.top_up(10)
      expect { subject.touch_out(5) }.to change{ subject.balance }.by(-5)
    end
  end
end