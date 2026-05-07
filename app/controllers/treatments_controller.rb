class TreatmentsController < ApplicationController
  before_action :set_appointment
  before_action :set_treatment, only: [:edit, :update, :destroy]

  def new
    @treatment = @appointment.treatments.build
  end

  def create
    @treatment = @appointment.treatments.build(treatment_params)
    if @treatment.save
      redirect_to @appointment, notice: 'treatment added'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @treatment.update(treatment_params)
      redirect_to @appointment, notice: 'treatment updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @treatment.destroy
    redirect_to @appointment, notice: 'treatment deleted'
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def set_treatment
    @treatment = @appointment.treatments.find(params[:id])
  end

  def treatment_params
    params.expect(treatment: [ :appointment_id, :description, :cost, :clinical_notes ])
  end
end