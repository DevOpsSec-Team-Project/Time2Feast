require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'returns_full_name' do
    user = User.create(first_name: 'Gordon', last_name: 'Ramsey')

    expect(user.full_name).to eq 'Gordon Ramsey'
  end

end
