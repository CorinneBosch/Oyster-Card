require "oyster_card"

describe OysterCard do
  describe "#balance" do
    it "should have a default balance" do
      expect(subject.balance).to eq(DEFAULT_BALANCE)
    end
  end
end