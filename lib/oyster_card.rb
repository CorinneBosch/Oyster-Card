DEFAULT_BALANCE = 0

class OysterCard
  attr_accessor :balance, :opening_balance

  def initialize(balance = DEFAULT_BALANCE)
    @opening_balance = balance
    @balance = @opening_balance
  end

  def top_up(value) 
    @balance = @balance + value
  end
end