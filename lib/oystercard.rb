
require_relative 'journey'

class Oystercard

  attr_reader :balance

  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @journey_log = []
  end

  def top_up(money)
    fail "Beyond limit of #{MAXIMUM_BALANCE}" if (balance + money) > MAXIMUM_BALANCE
    @balance += money
  end

  def touch_in(entry_s)
    fail "Insufficient balance" if balance < Journey::MINIMUM_FARE
      if (!@journey_log.empty? && !@journey_log.last.complete?)
        @journey_log.last.end(nil)
        deduct(@journey_log.last.fare)
      end
        @journey_log << Journey.new(entry_s)
  end

  def touch_out(exit_s)
    if @journey_log.last.complete?
       journey = Journey.new
       @journey_log << journey.end(exit_s)
    else
      @journey_log.last.end(exit_s)
    end
    deduct(@journey_log.last.fare)
  end

  def journey_history
    @journey_log
  end

  private

  def deduct(money)
    @balance -= money
  end

end
