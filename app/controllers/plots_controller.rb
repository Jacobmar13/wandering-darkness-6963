class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end

  def remove_plant
    @plot = Plot.find(params[:id])
    @plant = Plant.find(params[:plant_id])
    PlotPlant.locate(@plot.id, @plant.id).delete
    redirect_to plots_path
  end
end
