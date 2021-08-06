require 'rails_helper'

RSpec.describe 'the plots index' do
  describe 'views' do
    it 'shows all the plots with their plants' do
      visit plots_path

      expect(page).to have_content('')
    end
  end

  describe 'hyperlinks' do
    it '' do

    end
  end
end
