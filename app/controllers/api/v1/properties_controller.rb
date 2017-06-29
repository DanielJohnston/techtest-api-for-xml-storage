class Api::V1::PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :update, :destroy]

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
    if params.has_key?("properties")
      multi_params = params.permit(properties: [property: [:branch_id, :client_name, :branch_name, :department, :reference_number]])
      # Attempt an atomic creation
      success = Property.transaction do
        multi_params[:properties].each_pair do |key, property|
          Property.create!(property)
        end
      end
    else
      success = Property.create(property_params)
    end

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
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def property_params
      params.permit(property: [:branch_id, :client_name, :branch_name, :department, :reference_number])[:property]
    end
end
