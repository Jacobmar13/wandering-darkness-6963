# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start

require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.before(:each) do
    PlotPlant.destroy_all
    Plant.destroy_all
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

  end
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
