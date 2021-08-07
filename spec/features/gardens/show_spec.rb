require 'rails_helper'

RSpec.describe 'the garden show' do
  describe 'views' do
    it 'shows the plants associated with the gardens plots, ready to be picked in 100 days' do
      visit garden_path(@garden1.id)

      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant9.name)
      expect(page).to_not have_content(@plant8.name)
    end
  end
end
