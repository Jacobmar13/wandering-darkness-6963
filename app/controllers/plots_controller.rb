class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end

  def remove_plant
    @plot = Plot.find(params[:id])
    @plant = Plant.find(params[:plant_id])
    PlotPlant.find_by(plot_id: @plot.id, plant_id: @plant.id).delete
    redirect_to plots_path
  end
end
