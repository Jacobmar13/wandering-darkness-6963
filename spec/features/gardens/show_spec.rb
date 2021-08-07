require 'rails_helper'

RSpec.describe 'the garden show' do
  describe 'views' do
    it 'shows the plants associated with the gardens plots' do
      visit garden_path(@garden1.id)
    end
  end
end
