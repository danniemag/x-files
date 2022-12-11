# frozen_string_literal: true

# Controller for CRUD management of Applicants
class ApplicantsController < ApplicationController
  before_action :set_applicant, only: %i[show edit update destroy]

  # GET /applicants
  def index
    @applicants = Applicant.order(:name)
  end

  # GET /applicants/1
  def show; end

  # GET /applicants/new
  def new
    @applicant = Applicant.new
  end

  # GET /applicants/1/edit
  def edit; end

  # POST /applicants
  def create
    @applicant = Applicant.new(applicant_params)

    if @applicant.save
      redirect_to @applicant, notice: 'Applicant was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /applicants/1
  def update
    if @applicant.update(applicant_params)
      redirect_to @applicant, notice: 'Applicant was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /applicants/1
  def destroy
    @applicant.destroy
    redirect_to applicants_url, notice: 'Applicant was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def applicant_params
    params.require(:applicant).permit(:name, :overview, :funding, :project_id, :status)
  end
end
