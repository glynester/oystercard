require 'journey_log'


describe JourneyLog do
let(:station1) { double :station}   #, name: "Knightsbridge", zone: 1 }
let(:station2) { double :station}   #, name: "Old Street", zone: 2 }
let(:journey) {double :journey, entry_station: station1, exit_station: station2}
subject (:journeylog) {described_class.new}

#allow(journey).to receive(:finish).and_return {@exit_station = station2}
#allow(journey).to receive(:start).and_return{@entrance_station = station1}

  it 'starts a journey' do
    #allow(journey).to receive(:finish).and_return @exit_station
    journeylog.start_journey(station1)
    expect(journeylog.journey.entry_station).to eq station1
    puts journeylog.inspect
  end

  it 'ends a journey' do
    journeylog.finish_journey(station2)
    expect(journeylog.journey.exit_station).to eq station2
  end

  it 'stores a journey' do
    expect { journeylog.record(journey) }.to change { subject.log.count }.by 1
  end

end
