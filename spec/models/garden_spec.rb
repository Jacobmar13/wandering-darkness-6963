require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots) }
  end

  describe 'methods' do
    describe '#plot_plants' do
      it 'returns plants across all plots once, ready to harvest within 100 days' do
        expected = [
          @plant1.name,
          @plant2.name,
          @plant3.name,
          @plant4.name,
          @plant5.name,
          @plant6.name,
          @plant7.name,
          @plant9.name
        ]
        returned = @garden1.plot_plants.map do |plant|
          plant.name
        end

        expect(returned).to eq(expected)
      end
    end
  end
end
