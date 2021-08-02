DEFAULT_BALANCE = 0

class OysterCard
  attr_accessor :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end
end