require "station"

DEFAULT_BALANCE = 0
TOP_UP_LIMIT = 90
MINIMUM_REQUIRED = 1

class OysterCard
  attr_accessor :balance, :in_use, :journeys

  def initialize(balance = DEFAULT_BALANCE, in_use = false)
    @balance = balance
    @in_use = in_use
    @journeys = []
  end

  def top_up(value)
    message = "the top_up limit is #{TOP_UP_LIMIT}"
    (limit?(value)) ? ( @balance = @balance + value) : (raise message)
  end


  def in_journey?
    @in_use
  end

  def touch_out(fare)
    deduct(fare)
    @in_use = false
  end

  def touch_in(station)
    message = "You must top_up" 
    raise message unless minimum_balance?
    raise "This is not a station" unless station.instance_of?(Station)
    @journeys << station
    @in_use = true
  end

  private 

  def limit?(value)
     @balance + value <= TOP_UP_LIMIT
  end

  def minimum_balance?
    @balance >= MINIMUM_REQUIRED
  end

  def deduct(fare)
    @balance = @balance - fare
  end
end