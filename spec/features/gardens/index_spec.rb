require 'rails_helper'

RSpec.describe 'the gardens index' do
  describe 'views' do
    it 'shows all the gardens' do
      visit gardens_path

      expect(page).to have_content(@garden1.name)
      expect(page).to have_content(@garden2.name)
    end
    it "has link to garden" do
      visit gardens_path

      expect(page).to have_link(@garden1.name)
      expect(page).to have_link(@garden2.name)
    end
  end

  describe 'hyperlinks/buttons' do
    describe 'Garden link' do
      it 'can go to garden' do
        visit gardens_path

        click_link(@garden1.name)

        expect(current_path).to eq(garden_path(@garden1.id))
      end
    end
  end
end
