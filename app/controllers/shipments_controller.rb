class ShipmentsController < ApplicationController
  before_filter :require_login

  def index
    @shipments = Shipment.all
    @shipment = Shipment.new
  end

  def new
    @shipment = Shipment.new
  end

  def edit
    @shipment = Shipment.find(params[:id])
  end

  def create
    @shipment = Shipment.new(params[:shipment])
    @shipment.save
  end

  def show
   @shipment = Shipment.find(params[:id])
   @shipment.get_history_records unless @shipment.history_records.exists?
  end

  def destroy
    @shipment = Shipment.find(params[:id])
    @shipment.destroy
    redirect_to shipments_path
  end
end
