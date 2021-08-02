DEFAULT_BALANCE = 0
TOP_UP_LIMIT = 90

class OysterCard
  attr_accessor :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(value)
    message = "the top_up limit is #{TOP_UP_LIMIT}"
    (limit?(value)) ? ( @balance = @balance + value) : (raise message)
  end

  private 

  def limit?(value)
     @balance + value <= TOP_UP_LIMIT
  end

end