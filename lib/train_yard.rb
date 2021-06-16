class TrainYard
  attr_reader :location, :trains

  def initialize(yard_info)
    @location = yard_info[:location]
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def types_of_trains
    @trains.map do |train|
      train.type
    end.uniq.sort
  end

  def trains_containing(car)
    @trains.select do |train|
      train.cargo.include?(car)
    end
  end

  def sorted_cargo_list
    @trains.flat_map do |train|
      train.cargo.flat_map do |car, count|
        car.type
      end
    end.uniq.sort
  end

  def total_inventory
    inventory = Hash.new(0)
    @trains.each do |train|
     train.cargo.each do |car, count|
       inventory[car] += count
     end
    end
    inventory
  end

  def cargo_car_array
    @trains.flat_map do |train|
      train.cargo.flat_map do |car, count|
        car
      end
    end
  end

#if car is on more than one train and inventory is > 10
  def overflow_cars
    overflow = []
    @trains.select do |train|
      train.cargo.select do |car, count|
        if total_inventory[car] > 10 && cargo_car_array.count(car) > 1
          overflow << car
        end
      end
    end
    overflow.uniq
  end
end
