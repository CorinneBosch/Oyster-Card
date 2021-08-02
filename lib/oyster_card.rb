DEFAULT_BALANCE = 0

class OysterCard
  attr_accessor :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(value) 
    # (limit?(value)) ? ( @balance = @balance + value) : (raise 'you can not top up this much')
    if limit?(value)
      @balance = @balance + value
    else 
      raise "you can not top up this much"
    end
  end

  # private 

  def limit?(value)
     @balance + value <= 90
  end

end