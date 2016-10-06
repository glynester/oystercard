require_relative 'journey'

class JourneyLog

  def initialize
    @journeys = []
  end

  def start(entry_station)
    @current_journey = Journey.new(entry_station)
    @journeys << @current_journey
  end

  def finish(exit_station)
    current_journey.end(exit_station)
    @current_journey = nil
  end

  def journeys
    @journeys.dup
  end

  private
    def current_journey
    @current_journey || Journey.new
    end

end
