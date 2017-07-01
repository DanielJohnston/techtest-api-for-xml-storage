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
        property[:images_attributes] = property.delete :images
        property[:images_attributes] = Array.wrap(property[:images_attributes][:image]).map{|url_text|{url: url_text}}
        property[:floorplans_attributes] = property.delete :floorplans
        property[:floorplans_attributes] = Array.wrap(property[:floorplans_attributes][:floorplan]).map{|url_text|{url: url_text}}
        property[:epc_graphs_attributes] = property.delete :epc_graphs
        property[:epc_graphs_attributes] = Array.wrap(property[:epc_graphs_attributes][:epc_graph]).map{|url_text|{url: url_text}}
        property[:epc_front_pages_attributes] = property.delete :epc_front_pages
        property[:epc_front_pages_attributes] = Array.wrap(property[:epc_front_pages_attributes][:epc_front_page]).map{|url_text|{url: url_text}}
        property[:brochures_attributes] = property.delete :brochures
        property[:brochures_attributes] = Array.wrap(property[:brochures_attributes][:brochure]).map{|url_text|{url: url_text}}
        property[:virtual_tours_attributes] = property.delete :virtual_tours
        property[:virtual_tours_attributes] = Array.wrap(property[:virtual_tours_attributes][:virtual_tour]).map{|url_text|{url: url_text}}
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
      unfiltered_params.permit(:property_id, :branch_id, :client_name, :branch_name,
      :department, :reference_number, :address_name, :address_number, :address_street,
      :address2, :address3, :address4, :address_postcode, :country, :display_address,
      :property_bedrooms, :property_bathrooms, :property_ensuites, :property_reception_rooms,
      :property_kitchens, :display_property_type, :property_type, :property_style,
      :property_age, :floor_area, :floor_area_units, :property_feature1, :property_feature2,
      :property_feature3, :property_feature4, :property_feature5, :property_feature6,
      :property_feature7, :property_feature8, :property_feature9, :property_feature10,
      :price, :for_sale_poa, :price_qualifier, :property_tenure, :sale_by,
      :development_opportunity, :investment_opportunity, :estimated_rental_income,
      :availability, :main_summary, :full_description, :date_last_modified,
      :featured_property, :region_id, :latitude, :longitude,
        images_attributes: [:url, :modified], floorplans_attributes: [:url, :modified],
        epc_graphs_attributes: [:url, :modified])
    end

end
