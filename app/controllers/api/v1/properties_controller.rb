class Api::V1::PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :update, :destroy]

  rescue_from ActionController::ParameterMissing, with: :render_parameter_incorrect_response

  # GET /properties
  def index
    @properties = Property.all

    render xml: @properties
  end

  # GET /properties/1
  def show
    render xml: @property
  end

  # POST /properties
  def create
    @property_list = Array.wrap(params.require(:properties).require(:property))

    success = Property.transaction do
      @property_list.each do |property|
        Property.create!(allowable_params(property))
      end
    end

    return if performed? # Don't render if a response is already rendered

    if success
      # Renders an array as post requires it to be responsive to #empty?
      render xml: [success], status: :created
    else
      render xml: success.each(&:errors), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      render xml: @property
    else
      render xml: @property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /properties/1
  def destroy
    @property.destroy
  end

  private
    # Respond to invalid XML input at filtering stage
    def render_parameter_incorrect_response(exception)
      render xml: exception, status: :unprocessable_entity
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def allowable_params(unfiltered_params)
      unfiltered_params.permit(:branch_id, :client_name, :branch_name, :department, :reference_number)
    end
end
