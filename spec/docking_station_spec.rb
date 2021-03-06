require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to(:release_bike) }

    describe '#release_bike' do
      it "releases a working bike" do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:bike) }

    it "docks a bike" do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it "returns docked bikes" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end

    describe '#release_bike' do
      it "raises error when no bikes are docked" do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end
    end

    describe '#dock' do
      it "raises error when dock is full" do
        subject.dock(Bike.new)
        expect { subject.dock(Bike.new) }.to raise_error 'Docking station is full'
      end
    end

end
