require 'rails_helper'

RSpec.describe Operation, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @operation = FactoryBot.create(:operation, user: @user)
  end

  describe 'validations' do
    describe 'An operation has a name' do
      it 'should validate the presence of a name' do
        expect(@operation).to be_valid
      end

      it 'should not be valid without a name' do
        @operation.name = nil
        expect(@operation).to_not be_valid
      end
    end

    describe 'An operation has an amount' do
      it 'should validate the presence of an amount' do
        expect(@operation).to be_valid
      end

      it 'should not be valid without an amount' do
        @operation.amount = nil
        expect(@operation).to_not be_valid
      end

      it 'should not be valid with a negative amount' do
        @operation.amount = -1
        expect(@operation).to_not be_valid
      end

      it 'should not be valid with a zero amount' do
        @operation.amount = 0
        expect(@operation).to_not be_valid
      end

      it 'should be valid with a positive amount' do
        @operation.amount = 1.53
        expect(@operation).to be_valid
      end
    end
  end
end
