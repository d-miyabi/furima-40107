require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: user.id)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@order_address).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
   end
end