require 'rails_helper'

RSpec.describe Recipe, type: :model do
  
  describe '#formatted_duration' do
    it 'returns "30 mins" when only minutes is greater than 0' do
      recipe = Recipe.create(hours: 0, minutes: 30)
      expect(recipe.formatted_duration).to eq '30 mins'
    end

    it 'returns "1 hr" when only 1 hour and 0 minutes' do
      recipe = Recipe.create(hours: 1, minutes: 0)
      expect(recipe.formatted_duration).to eq '1 hr'
    end

    it 'returns "2 hrs" when multiple hours and 0 minutes' do
      recipe = Recipe.create(hours: 2, minutes: 0)
      expect(recipe.formatted_duration).to eq '2 hrs'
    end

    it 'returns "1 min" when only 1 minute and 0 hours' do
      recipe = Recipe.create(hours: 0, minutes: 1)
      expect(recipe.formatted_duration).to eq '1 min'
    end

    it 'returns "45 mins" when only minutes > 1 and hours = 0' do
      recipe = Recipe.create(hours: 0, minutes: 45)
      expect(recipe.formatted_duration).to eq '45 mins'
    end

    it 'returns "1 hr 30 mins" when both hours and minutes > 0' do
      recipe = Recipe.create(hours: 1, minutes: 30)
      expect(recipe.formatted_duration).to eq '1 hr 30 mins'
    end

    it 'returns "NA" when both hours and minutes are nil' do
      recipe = Recipe.create(hours: nil, minutes: nil)
      expect(recipe.formatted_duration).to eq 'NA'
    end
  end
  
end
