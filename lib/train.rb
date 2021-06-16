class Train
  attr_reader :name, :type, :cargo

  def initialize(train_info)
    @name = train_info[:name]
    @type = train_info[:type]
    @cargo = Hash.new(0)
  end

  def count_cars(car)
    @cargo[car]
  end

  def add_cars(car, count)
    @cargo[car] += count
  end

  def weight
    @cargo.map do |car, count|
      count * car.weight
    end.sum
  end
end
