class Car
  attr_reader :type, :weight

  def initialize(car_info)
    @type = car_info[:type]
    @weight = car_info[:weight]
  end

end
