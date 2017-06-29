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
    @property = Property.new(property_params)
    # byebug

    if @property.save
      render xml: @property, status: :created, location: @property
    else
      render xml: @property.errors, status: :unprocessable_entity
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
      params.require(:property).permit(:branch_id, :client_name, :branch_name, :department, :reference_number)
    end
end
