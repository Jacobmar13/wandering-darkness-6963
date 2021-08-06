require 'rails_helper'

RSpec.describe 'the plots index' do
  describe 'views' do
    it 'shows all the plots with their plants' do
      visit plots_path

      expect(page).to have_content(@plant4.name)
      expect(page).to have_content(@plant5.name)
      expect(page).to have_content(@plant6.name)
      expect(page).to have_content("Plot Number: #{@plot1.number}")
      expect(page).to have_content("Plot Number: #{@plot2.number}")
      expect(page).to have_content("Plot Number: #{@plot3.number}")
      expect(page).to have_content("Plot Number: #{@plot4.number}")
    end
    it "has button 'remove plant' from plot" do
      visit plots_path

      within("#plot#{@plot1.id}") do
        expect(page).to have_button("Remove #{@plant4.name}")
      end
    end
  end

  describe 'hyperlinks/buttons' do
    describe 'Remove Plant' do
      it 'can remove plant from plot, but not delete plant from other plots' do
        visit plots_path

        within("#plot#{@plot1.id}") do
          expect(page).to have_content(@plant4.name)

          click_button("Remove #{@plant4.name}")

          expect(current_path).to eq(plots_path)

          expect(page).to_not have_content(@plant4.name)
        end

        within("#plot#{@plot2.id}") do
          expect(page).to have_content(@plant4.name)
        end
      end
    end
  end
end
