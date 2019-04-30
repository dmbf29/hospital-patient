class Room
  attr_accessor :id
  attr_reader :capacity

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity] || 0 # integer
    @patients = attributes[:patients] || [] #
  end

  def full?
    @capacity <= @patients.length
  end

  def add_patient(patient) #instance of patient!
    if full?
      fail Exception, "The room is full"
    else
      @patients << patient
      # self = vip_room
      patient.room = self
    end
  end
end

