require_relative 'journey'

class JourneyLog

  def initialize
    @journeys = []
  end

  def start(entry_station)
    if @current_journey
      @current_journey.end
    end
    @current_journey = Journey.new(entry_station)
    @journeys << @current_journey
  end

  def finish(exit_station)
    unless @current_journey.nil?
      current_journey.end(exit_station)
    else
      journey = Journey.new
      @journeys << journey.end(exit_station)
    end
    @current_journey = nil
    self
  end

  def journeys
    @journeys.dup
  end

  def outstanding_charges
    @current_journey ? Journey::PENALTY_FARE : 0
  end

  private
    def current_journey
    @current_journey
    end

end
