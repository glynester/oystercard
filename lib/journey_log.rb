require_relative 'journey'

class JourneyLog

  def initialize
    @journeys = []
  end

  def start(entry_station)
    @journeys << Journey.new(entry_station)
  end

  def finish(exit_station)
    @journeys << current_journey.end(exit_station)
  end

  def journeys
    @journeys
  end

  private

  def current_journey
    if !@journeys.last.complete?
      @journeys.last
    else
      Journey.new
    end
  end

end
