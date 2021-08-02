require "oyster_card"

describe OysterCard do
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
      # p subject.limit?(91)
      error = 'you can not top up this much'
      # expect(subject.top_up(60)).to eq 60
      expect(subject.top_up(91)).to raise_error error
    end
  end
end