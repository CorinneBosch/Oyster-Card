DEFAULT_BALANCE = 0
TOP_UP_LIMIT = 90
MINIMUM_REQUIRED = 1

class OysterCard
  attr_accessor :balance, in_use

  def initialize(balance = DEFAULT_BALANCE, in_use = false)
    @balance = balance
    @in_use = in_use
  end

  def top_up(value)
    message = "the top_up limit is #{TOP_UP_LIMIT}"
    (limit?(value)) ? ( @balance = @balance + value) : (raise message)
  end

  def deduct(fare)
    message = "You must top_up"
    (minimum_balance?) ? ( @balance = @balance - fare) : (raise message)
  end

  private 

  def limit?(value)
     @balance + value <= TOP_UP_LIMIT
  end

  def minimum_balance?
    @balance >= MINIMUM_REQUIRED
  end
end