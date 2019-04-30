class AppointmentsController
  def create_appointment
    doctor_id = @view.ask_for_doctor_id
    patient_id = @view.ask_for_patient_id
    appointment = Appointment.new
    appointment.doctor = @doctor_repository.find(doctor_id)
    appointment.patient = @patient_repository.find(patient_id)
    @appointment_repository.add(appointment)
  end
end

