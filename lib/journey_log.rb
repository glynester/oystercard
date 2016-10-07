require_relative 'journey'

class JourneyLog

  def initialize
    @journeys = []
  end

  def start(entry_station)
    fail 'Already in a Journey' if current_journey.entry_station
    @current_journey = Journey.new(entry_station)
    @journeys << @current_journey
  end

  def finish(exit_station)
    if current_journey.entry_station
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

  private
    def current_journey
    @current_journey
    end

end
