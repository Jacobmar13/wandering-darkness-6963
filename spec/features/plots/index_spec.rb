require 'rails_helper'

RSpec.describe 'the plots index' do
  describe 'views' do
    it 'shows all the plots with their plants' do
      visit plots_path
      save_and_open_page
      expect(page).to have_content('Raspberry')
      expect(page).to have_content('Strawberry')
      expect(page).to have_content('Pineapple')
      expect(page).to have_content("Plot Number: #{@plot1.number}")
      expect(page).to have_content("Plot Number: #{@plot2.number}")
      expect(page).to have_content("Plot Number: #{@plot3.number}")
      expect(page).to have_content("Plot Number: #{@plot4.number}")
    end
  end

  describe 'hyperlinks' do
    it '' do

    end
  end
end
