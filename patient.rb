class Patient
  attr_reader :name, :age
  attr_accessor :room, :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name] #string
    @age = attributes[:age] #integer
    @room = attributes[:room] # INSTANCE OF A ROOM
    @cured = attributes[:cured] || false #boolean
  end

  def cured?
    @cured
  end

  def mark_as_cured!
    @cured = true
  end
end
