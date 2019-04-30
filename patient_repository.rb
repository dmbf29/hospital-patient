require "csv"

class PatientRepository
  def initialize(csv_file_path = "./patients.csv")
    @csv_file_path = csv_file_path
    @patients = []
    @next_id = 1
    load_from_csv
  end

  def add_patient(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
    save_to_csv
  end

  private

  def load_from_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      # row is like a hash
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:cured] = row[:cured] == "true"  # Convert column to boolean
      @patients << Patient.new(row)
    end
    # @next_id = @patients.last.id + 1
    # what if patients is empty?
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end

  def save_to_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ['id', 'name', 'age', 'room_id']
      @patients.each do |patient|
        p patient
        csv << [patient.id, patient.name, patient.age, patient.room.id]
      end
    end
  end
end
