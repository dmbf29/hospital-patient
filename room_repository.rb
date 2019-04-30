require "csv"

class RoomRepository
  def initialize(csv_file_path = "./rooms.csv")
    @csv_file_path = csv_file_path
    @rooms = []
    @next_id = 1
    load_from_csv
  end

  def add_room(room)
    room.id = @next_id
    @rooms << room
    @next_id += 1
    save_to_csv
  end

  private

  def load_from_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      # row is like a hash
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:capacity] = row[:capacity].to_i  # Convert column to boolean
      @rooms << Room.new(row)
    end
  end

  def save_to_csv
    # csv_options = { headers: :first_row, header_converters: :symbols }
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ['id', 'capacity']
      @rooms.each do |room|
        csv << [room.id, room.capacity]
      end
    end
  end
end
