# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Plant.destroy_all
PlotPlant.destroy_all
Plot.destroy_all
Garden.destroy_all

# Gardens
@garden1 = Garden.create!(name: 'Smuckers Delicious Garden', organic: true)
@garden2 = Garden.create!(name: 'Space Garden Omega', organic: false)

# Plots
  # Garden1
  @plot1 = Plot.create!(number: 1, size: 'Large', direction: 'North', garden_id: @garden1.id)
  @plot2 = Plot.create!(number: 2, size: 'Medium', direction: 'East', garden_id: @garden1.id)
  @plot3 = Plot.create!(number: 3, size: 'Small', direction: 'South', garden_id: @garden1.id)

  # Garden2
  @plot4 = Plot.create!(number: 4, size: 'Large', direction: 'West', garden_id: @garden2.id)

#Plants
@plant1 = Plant.create!(name: 'Daisy', description: 'Yellow flower', days_to_harvest: 10)
@plant2 = Plant.create!(name: 'Rose', description: 'Red thorned flower', days_to_harvest: 30)
@plant3 = Plant.create!(name: 'Bluebonnet', description: 'Deep blue wildflower', days_to_harvest: 5)
@plant4 = Plant.create!(name: 'Pineapple', description: 'Sour fruit with hard skin', days_to_harvest: 30)
@plant5 = Plant.create!(name: 'Strawberry', description: 'Red small berries', days_to_harvest: 15)
@plant6 = Plant.create!(name: 'Raspberry', description: 'Dark red small sour berries', days_to_harvest: 10)

#PlotPlants
  # Plot1
  @plot_plant1 = PlotPlant.create!(plot_id: @plot1.id , plant_id: @plant4.id)
  @plot_plant2 = PlotPlant.create!(plot_id: @plot1.id , plant_id: @plant5.id)
  @plot_plant3 = PlotPlant.create!(plot_id: @plot1.id , plant_id: @plant6.id)

  #Plot2
  @plot_plant4 = PlotPlant.create!(plot_id: @plot2.id , plant_id: @plant1.id)
  @plot_plant5 = PlotPlant.create!(plot_id: @plot2.id , plant_id: @plant2.id)
  @plot_plant6 = PlotPlant.create!(plot_id: @plot2.id , plant_id: @plant3.id)
  @plot_plant7 = PlotPlant.create!(plot_id: @plot2.id , plant_id: @plant4.id)
  @plot_plant8 = PlotPlant.create!(plot_id: @plot2.id , plant_id: @plant5.id)
  @plot_plant9 = PlotPlant.create!(plot_id: @plot2.id , plant_id: @plant6.id)

  #Plot3
  @plot_plant10 = PlotPlant.create!(plot_id: @plot3.id , plant_id: @plant1.id)
  @plot_plant11 = PlotPlant.create!(plot_id: @plot3.id , plant_id: @plant2.id)
  @plot_plant12 = PlotPlant.create!(plot_id: @plot3.id , plant_id: @plant3.id)

  #Plot4
  @plot_plant13 = PlotPlant.create!(plot_id: @plot4.id , plant_id: @plant1.id)
  @plot_plant14 = PlotPlant.create!(plot_id: @plot4.id , plant_id: @plant2.id)
  @plot_plant15 = PlotPlant.create!(plot_id: @plot4.id , plant_id: @plant3.id)
