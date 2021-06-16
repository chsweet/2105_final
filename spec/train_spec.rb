require 'rspec'
require './lib/car'
require './lib/train'

RSpec.describe Train do
  describe 'Iteration 1' do
    before :each do
      @train1 = Train.new({name: 'Thomas', type: 'Tank'})
      @car1 = Car.new({type: 'Mail', weight: 5})
      @car2 = Car.new({type: 'Passengers', weight: 1})
    end

    it 'exists' do
      expect(@train1).to be_a(Train)
    end

    it 'has attributes' do
      expect(@train1.name).to eq('Thomas')
      expect(@train1.type).to eq('Tank')
      expect(@train1.cargo).to eq({})
    end

    it 'can count cars' do
      expect(@train1.count_cars(@car1)).to eq(0)
    end

    it 'can add cars to cargo' do
      @train1.add_cars(@car1, 2)

      expect(@train1.cargo).to eq({@car1 => 2})
      expect(@train1.count_cars(@car1)).to eq(2)

      @train1.add_cars(@car1, 3)

      expect(@train1.cargo).to eq({@car1 => 5})
      expect(@train1.count_cars(@car1)).to eq(5)

      @train1.add_cars(@car2, 10)

      expect(@train1.cargo).to eq({@car1 => 5, @car2 => 10})
    end
  end

  describe 'Iteration 2' do
    before :each do
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
    end

    it 'can calculate the sum of trains weight' do
      expect(@train1.weight).to eq(27)
    end

  end
end
