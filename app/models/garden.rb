class Garden < ApplicationRecord
  has_many :plots
  has_many :plants, through: :plots

  def plot_plants
    plots.joins(:plants)
    .where('plants.days_to_harvest < ?', 100)
    .select('plants.*')
    .group('plants.id')
  end
end
