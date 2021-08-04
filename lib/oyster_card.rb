require "station"

DEFAULT_BALANCE = 0
TOP_UP_LIMIT = 90
MINIMUM_REQUIRED = 1

class OysterCard
  attr_accessor :balance, :journeys, :entry_station, :exit_station

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @entry_station = entry_station
    @exit_station = exit_station
    @journeys = []
  end

  def top_up(value)
    message = "the top_up limit is #{TOP_UP_LIMIT}"
    (limit?(value)) ? ( @balance = @balance + value) : (raise message)
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_out(exit_s, fare)
    @entry_station = nil
    @exit_station = exit_s
    @journeys.last[:finish] = exit_s
    deduct(fare)
  end

  def touch_in(entry)
    message = "You must top_up" 
    raise message unless minimum_balance?
    raise "This is not a station" unless entry.instance_of?(Station)
    @entry_station = entry
    @journeys << { :start => entry }
  end

  private 
  def limit?(value)
    @balance + value <= TOP_UP_LIMIT
  end

  def minimum_balance?
    @balance >= MINIMUM_REQUIRED
  end

  def deduct(fare)
    @balance = @balance -= fare
  end
end
