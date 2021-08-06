class Garden < ApplicationRecord
  has_many :plots

  def plot_plants
    plots.joins(:plants)
    .select('plots.*, plants.*')
    .group('plots.id, plants.id')
  end
end
