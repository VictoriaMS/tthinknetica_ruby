require_relative 'instance_counter'
require_relative 'manufacture_company'

class Wagon 
include ManufactureCompany
include InstanceCounter

  @@wagons = []

  def self.all
    @@wagons 
  end 

  def initialize 
    @@wagons << self
    register_instance
  end

end