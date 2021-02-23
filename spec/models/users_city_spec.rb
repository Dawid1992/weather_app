require 'rails_helper'

RSpec.describe UsersCity, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      user_city = UsersCity.new(country: 'pl',user_id: 1).save
      expect(user_city).to eq(false)
    end
    it 'ensures user_id presence' do
      user_city = UsersCity.new(country: 'pl',name: 'wroclaw').save
      expect(user_city).to eq(false)
    end
    it 'should save successfully' do
      user_city = UsersCity.new(name: 'wroclaw',country: 'pl',user_id: 1).save
      expect(user).to eq(true)
    end
  end
end


