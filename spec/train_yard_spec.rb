require 'rspec'
require './lib/car'
require './lib/train'
require './lib/train_yard'

RSpec.describe TrainYard do
  describe 'Iteration 2' do
    before :each do
      @train_yard = TrainYard.new({location: 'Brighton'})
      @car1 = Car.new({type: 'Mail', weight: 5})
      @car2 = Car.new({type: 'Passengers', weight: 1})
      @car3 = Car.new({type: 'Cattle', weight: 3})
      @car4 = Car.new({type: 'Dining', weight: 4})
      @train1 = Train.new({name: 'Thomas', type: 'Tank'})
      @train2 = Train.new({name: 'Emily', type: 'Tender'})
      @train3 = Train.new({name: 'Nia', type: 'Tank'})
      @train4 = Train.new({name: 'Gordon', type: 'Express'})

      @train1.add_cars(@car1, 5)
      @train1.add_cars(@car2, 2)
      @train2.add_cars(@car1, 3)
      @train2.add_cars(@car4, 4)
      @train3.add_cars(@car1, 1)
      @train4.add_cars(@car4, 5)
      @train4.add_cars(@car3, 10)

      @train_yard.add_train(@train1)
      @train_yard.add_train(@train2)
      @train_yard.add_train(@train3)
      @train_yard.add_train(@train4)
    end

    it 'exists' do
      expect(@train_yard).to be_a(TrainYard)
    end

    it 'has attributes' do
      expect(@train_yard.location).to eq('Brighton')
    end

    it 'can add trains' do
      expect(@train_yard.trains).to eq([@train1, @train2, @train3, @train4])
    end

    it 'returns array of types of trains' do
      expect(@train_yard.types_of_trains).to eq(['Express', 'Tank', 'Tender',])
    end

    it 'returns array of trains that have the car' do
      expect(@train_yard.trains_containing(@car1)).to eq([@train1, @train2, @train3])
    end
  end

  describe 'Iteration 3' do
    before :each do
      @train_yard = TrainYard.new({location: 'Brighton'})
      @car1 = Car.new({type: 'Mail', weight: 5})
      @car2 = Car.new({type: 'Passengers', weight: 1})
      @car3 = Car.new({type: 'Cattle', weight: 3})
      @car4 = Car.new({type: 'Dining', weight: 4})
      @train1 = Train.new({name: 'Thomas', type: 'Tank'})
      @train2 = Train.new({name: 'Emily', type: 'Tender'})
      @train3 = Train.new({name: 'Nia', type: 'Tank'})
      @train4 = Train.new({name: 'Gordon', type: 'Express'})

      @train1.add_cars(@car1, 5)
      @train2.add_cars(@car1, 3)
      @train2.add_cars(@car4, 4)
      @train3.add_cars(@car1, 4)
      @train4.add_cars(@car4, 5)
      @train4.add_cars(@car3, 10)

      @train_yard.add_train(@train1)
      @train_yard.add_train(@train2)
      @train_yard.add_train(@train3)
      @train_yard.add_train(@train4)
    end

    it 'returns array of sorted cargo' do
      expect(@train_yard.sorted_cargo_list).to eq(['Cattle', 'Dining', 'Mail'])
    end

    it 'returns total quanity of cars in yard' do
      expect(@train_yard.total_inventory).to eq({@car1 => 12, @car3 => 10, @car4 => 9})
    end

    it 'returns the overflow of cars' do
      expect(@train_yard.overflow_cars).to eq([@car1])
    end
  end
end
