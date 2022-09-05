require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, user: @user)
  end
  describe 'validations' do
    describe 'A group has a name' do
      it 'should validate the presence of a name' do
        expect(@group).to be_valid
      end

      it 'should not be valid without a name' do
        @group.name = nil
        expect(@group).to_not be_valid
      end
    end
  end
end
