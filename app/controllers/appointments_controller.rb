class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all.includes(:pet, :vet)
  end

  def show
    @appointment = Appointment.includes(treatments: :rich_text_clinical_notes).find(params[:id])
  end

  private

  def appointment_params
    params.require(:appointment).permit(:pet_id, :vet_id, :status, :appointment_date, :reason)
  end
end