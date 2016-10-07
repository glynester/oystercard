require 'journey_log'
describe JourneyLog do

  let(:journey){ double :journey}   #, @entry_station="Vic", @exit_station="Aldgate" } #this may need to have some methods
  let(:station){ double :station }
  let(:station1){ double :station }
  #let(:journey_class){double :journey_class, new: journey}
  #ubject (:jou)

    it 'initializes with an empty array of journeys' do
      expect(subject.journeys).to be_empty
    end

    describe "#start" do
        it 'creates new journey with correct entry station' do
          subject.start(station)
          expect(subject.journeys.last.entry_station).to eq station   
        end
    end
    
    describe "#finish" do  
      it 'completes journey with correct exit station' do
        subject.start(station)
        subject.finish(station1)
        expect(subject.journeys.last.exit_station).to eq station1   
      end
    end
    
    
    
    # it 'if user touches in twice, end previous journey' do


    # end
    
    #   it 'allows you to touch out without touching in and saves second station' do


    # end
    
    # it 'allows you to touch out twice with nil entry station' do

    # end
    
    



#
#   describe '#start' do
#     it 'starts a journey' do
#       subject.start(station)
#       expect(subject.journeys).to include
#     end
#
#     it 'records a journey' do
#       allow(journey_class).to receive(:new).and_return journey
#       subject.start(station)
#       expect(subject.journeys).to include journey
#     end
#   end
end
