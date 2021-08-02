require "oyster_card"

describe OysterCard do
  describe "default balance" do
    it "should have a default balance" do
      expect(subject.balance).to eq(DEFAULT_BALANCE)
    end
  end

  describe "#top_up" do
    it "should top up by given argument" do
      subject.top_up(10)
      expect(subject.balance).to eq(subject.opening_balance + 10)
    end
  end
end