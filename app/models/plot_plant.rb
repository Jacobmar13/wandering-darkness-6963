class PlotPlant < ApplicationRecord
  belongs_to :plot
  belongs_to :plant

  def self.locate(plot_id, plant_id)
    where('plot_id = ?', plot_id).where('plant_id = ?', plant_id).first
  end
end
