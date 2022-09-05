require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user, email: 'example@email.com')
  end

  describe 'validations' do
    describe 'An user has a name' do
      it 'should validate the presence of a name' do
        @user.name = 'Felipe'
        expect(@user).to be_valid
      end

      it 'should not be valid without a name' do
        @user.name = nil
        expect(@user).to_not be_valid
      end
    end

    describe 'An user has an email' do
      it 'should validate the presence of an email' do
        expect(@user).to be_valid
      end

      it 'should not be valid without an email' do
        @user.email = nil
        expect(@user).to_not be_valid
      end
    end

    describe 'An user has a password' do
      it 'should validate the presence of a password' do
        @user.password = 'password'
        expect(@user).to be_valid
      end

      it 'should not be valid without a password' do
        @user.password = nil
        expect(@user).to_not be_valid
      end
    end

    describe 'An user has a unique email' do
      it 'should validate the uniqueness of an email' do
        user2 = FactoryBot.build(:user, email: 'example@email.com')
        expect(user2).to_not be_valid
      end
    end
  end
end
