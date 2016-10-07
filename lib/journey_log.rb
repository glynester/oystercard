require_relative 'oystercard'
require_relative 'journey'

class JourneyLog
  
  attr_reader :journey
  
  def initialize
    @journeys = []
    #@journey = station                   # What should be here????????????
    #@journey = Journey.new(station)
  end
  
  def start_journey(station)
    @journey = Journey.new(station)
  end
    
  def finish_journey(station)
    @journey.finish(station)            #problem here!!!!!!!!!!!!!!!
  end
    
  def record(journey)
    @journeys << journey
  end
    
end
